use library;

select * from lib_card
join borrower on borrower.lib_card_id = lib_card.lib_card_id;

select * from books
join written_by on books.isbn = written_by.isbn
join authors on written_by.author_id = authors.author_id
join book_copies on book_copies.isbn = books.isbn;

select l.loan_id, b.title, bc.availability, l.borrow_date, l.due_date, borrower.borrower_first from loans l
join borrower bor on l.borrower_id = bor.borrower_id
join book_copies bc on bc.copy_num = l.copy_num
join books b on bc.isbn = b.isbn
join borrower on l.borrower_id = borrower.borrower_id;

select borrower_id, books.isbn, books.title, hold_date from holds
join books on books.isbn = holds.isbn;

select * from returned_book
right outer join loans on returned_book.loan_id = loans.loan_id
left outer join fines on fines.loan_id = loans.loan_id;


SELECT fines.fine_id, rb.return_date from fines join returned_book rb on rb.loan_id = fines.loan_id;

select due_date from loans where loan_id = 1;

-- Queries on Functions
select borrower_total_loans(55684) as "TotalBooksBorrowed";
select book_total_loans(9798745274824) "TotalTimesBookBorrowed";
select borrower_branch_count(2);

call get_book_by_genre('Fiction');
call get_borrower_by_branch(5);
call get_books_by_branch(5);
call book_availability('Available');
call book_availability('Checked Out');

select * from book_copies where isbn =9780385490818;