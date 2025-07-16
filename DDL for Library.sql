use library;

/*drop table fine_payment;
drop table fines;
drop table holds;
drop table returned_book;
drop table loans;
drop table borrower;
drop table lib_card;
drop table written_by;
drop table authors;
drop table book_copies;
drop table branches;
drop table books;*/

create table books(
	ISBN bigint(13) primary key,
	title varchar(40) not null,
    publication_year int(4), -- can't use YEAR datatype because some years are prior to 1900
    genre varchar(25)
);

create table branches(
	branch_num int primary key,
    branch_name varchar(15) unique not null,
    zip_code int(5) unique not null
);

create table book_copies(
	ISBN bigint(13),
    copy_num int auto_increment,
    branch_num int,
	availability varchar(12),
    primary key (copy_num, ISBN),
	foreign key (isbn) references books(ISBN),
	foreign key (branch_num) references branches(branch_num)
);

create table authors(
	author_id int primary key,
    author_first varchar(20),
    author_last varchar(20)
);

create table written_by(
	ISBN bigint(13),
    author_id int,
	primary key (ISBN, author_id),
    foreign key (ISBN) references books(ISBN),
	foreign key (author_id) references authors(author_id)
);

create table lib_card(
	lib_card_id int primary key,
    activation_date date,
    expiration_date date AS (date_add(activation_date, interval 3 year))
);

create table borrower(
	borrower_id int primary key auto_increment,
    borrower_first varchar(20),
    borrower_last varchar(20),
    lib_card_id int(10),
    phone bigint(10),
    email varchar(30) unique not null,
    home_branch_num int,
    foreign key (home_branch_num) references branches(branch_num),
    foreign key (lib_card_id) references lib_card(lib_card_id)
);

create table loans(
	loan_id int auto_increment primary key,
    borrower_id int,
    ISBN bigint(13),
    copy_num int,
    borrow_date date default(current_date),
    due_date date as (date_add(borrow_date, interval 14 day)),
    foreign key (borrower_id) references borrower(borrower_id),
    foreign key (copy_num) references book_copies(copy_num),
    foreign key (ISBN) references book_copies(ISBN)
);

create table returned_book(
	return_id int auto_increment primary key,
    loan_id int unique,
    return_date date,
    branch_num int,
    foreign key (branch_num) references branches(branch_num),
    foreign key (loan_id) references loans(loan_id)
);

create table holds(
	borrower_id int,
    ISBN bigint(13),
    hold_date date default (current_date),
    primary key (borrower_id, ISBN, hold_date),
    foreign key (borrower_id) references borrower(borrower_id),
    foreign key (ISBN) references books(ISBN)
);

create table fines(
	fine_id int primary key auto_increment,
    loan_id int,
    fine_amount decimal(13,2),
    foreign key (loan_id) references loans(loan_id)
);

create table fine_payment(
	transaction_id int primary key auto_increment,
    fine_id int,
    amount_paid decimal(13,2),
    payment_date date default(current_date),
    transaction_type varchar (15),
    foreign key (fine_id) references fines(fine_id)
);
 
 /*----------------------------------------------------------------------------------
 Creating Procedures, Functions, Triggers*/
 
-- Trigger to add fine upon late return
delimiter $$
create trigger add_fine_when_late
after insert
on returned_book for each row
begin
    declare due_date_ date;
    declare fine int;
    set @fine = 2.5;
    select due_date into due_date_ from loans l
                where l.loan_id = new.loan_id order by due_date limit 1;
    if new.return_date > due_date_ then
		insert into library.fines (loan_id, fine_amount)
		values (new.loan_id, @fine);
	end if;
end $$
delimiter ;
# drop trigger AddFine;

-- Function to Count total loans per borrower
delimiter $$
create function borrower_total_loans(borrower_id int)
returns int
begin
	declare LoansCount int;
    select COUNT(*) into LoansCount
    from loans where loans.borrower_id = borrower_id;
    return LoansCount;
end $$
delimiter ;
# drop function BorrowerTotalLoans;

-- Funtion to Count total loans per Book Title
delimiter $$
create function book_total_loans(ISBN bigint)
returns int 
begin
	declare LoansCount int;
    select COUNT(*) into LoansCount
    from loans where loans.ISBN = ISBN;
    return LoansCount;
end $$
delimiter ;
# drop function BookTotalLoans;

-- Function: Return the number of borrowers that belong to a certain branch.
delimiter $$
create function borrower_branch_count(branch_num int)
returns int
deterministic
begin
declare borrower_count int;
    select count(*) into borrower_count
    from borrower
    where borrower.home_branch_num = branch_num;
    return borrower_count;
end $$
delimiter ;
#Drop function borrower_branch_count;

-- PROCEDURES
-- procedure to get book by genre
delimiter $$
create procedure get_book_by_genre(book_genre varchar(25))
begin
select *
    from books
    where genre = book_genre;
end $$
delimiter ;
#Drop procedure get_book_by_genre;

-- procedure to get all borrowers that belong to a given branch.
delimiter $$
create procedure get_borrower_by_branch(branch int)
begin
select *
    from borrower
    where home_branch_num = branch;
end $$
delimiter ;
# drop procedure get_borrower_by_branch;

-- procedure to get books at a branch
delimiter $$
create procedure get_books_by_branch(branch int)
begin
select b.title, b.ISBN, bc.copy_num,a.author_first, a.author_last
    from books b join written_by wb on b.isbn = wb.isbn
    join authors a on wb.author_id = a.author_id
    join book_copies bc on b.isbn = bc.isbn
    where bc.branch_num = branch;
end $$
delimiter ;
# drop procedure get_books_by_branch;

-- VIEWS
-- View: a view of all borrowers with their email, phone number, and library card ID of each.
create view borrower_branch_info as
select borrower.borrower_first, borrower.borrower_last, borrower.email, borrower.phone, borrower.lib_card_id
    from borrower, branches
    where borrower.home_branch_num = branches.branch_num;

-- View: a view of all the borrower information with their book ISBN, title, genre, author name, borrow date, and return date.
create view borrowing_history as
select books.ISBN, books.title, books.genre, authors.author_first, authors.author_last, loans.borrow_date, returned_book.return_date -- can also be changed to due date without a join
    from loans, returned_book, books, written_by, authors
    where loans.loan_id = returned_book.loan_id
	and books.ISBN = written_by.ISBN
        and written_by.author_id = authors.author_id;

-- EXTRA PROCEDURE/FUNCTIONS/TRIGGERS BEYOND REQUIREMENTS
-- Trigger to Update availability and branch of a copy when it is returned
delimiter $$
create trigger update_copy_on_return
after insert on returned_book for each row
begin
    declare ISBN_ bigint;
    declare copy_num_ int;
    declare checkout_status varchar(12);
    declare branch_num_ int;
    set @checkout_status = 'Available';
    select copy_num into copy_num_ from loans where loans.loan_id = new.loan_id;
    select ISBN into ISBN_ from loans where loans.loan_id = new.loan_id;
    set @branch_num_ = new.branch_num;
    
    update book_copies set branch_num = @branch_num_, availability = @checkout_status
	where book_copies.isbn = ISBN_ and book_copies.copy_num = copy_num_;
end $$
delimiter ;
# drop trigger updatecopyonreturn;

-- Trigger to update availability of a copy when it is borrowed
delimiter $$
create trigger update_copy_on_checkout
after insert on loans for each row
begin
    declare ISBN_ bigint;
    declare copy_num_ int;
    declare checkout_status varchar(12);
    declare branch_num_ int;
    set @checkout_status = 'Checked Out';
    select copy_num into copy_num_ from loans where loans.loan_id = new.loan_id;
    select ISBN into ISBN_ from loans where loans.loan_id = new.loan_id;
    update book_copies set availability = @checkout_status
	where book_copies.isbn = ISBN_ and book_copies.copy_num = copy_num_;
end $$
delimiter ;    
# drop trigger updatecopyoncheckout;
