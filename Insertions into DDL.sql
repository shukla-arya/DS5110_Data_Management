use library;

/* Information Inputs:
1) ISBNs taken from Amazon
2) Price taken from Amazon
3) IDs generated randomly (5-digits)
4) Borrowers are from class roster
5) Emails are lastname.firstinitial@northeastern.edu
6) Phone # is randomly generated 10 digit number
*/

-- Add Library Branches (10)
insert into branches(branch_num, branch_name, zip_code)
values(01, "Downtown Boston", "02101"),
(02, "Beacon Hill", "02108"),
(03, "Fenway", "02115"),
(04, "Back Bay", "02116"),
(05, "South End", "02118"),
(06, "Allston", "02134"),
(07, "Cambridge", "02138"),
(08, "Somerville", "02145"),
(09, "Dorchester", "02124"),
(10, "West Roxbury", "02132");

-- Adding Book/Author/Genre/Publisher Information (20)

-- The Great Gatsby
insert into books(ISBN, title, publication_year, genre)
values(9798745274824, "The Great Gatsby", 1925, 'Fiction');
insert into authors(author_id, author_first, author_last)
values(70952, "Francis", "Fitzgerald");
insert into written_by(ISBN, author_id)
values (9798745274824,70952);

-- The Catcher in the Rye
insert into books()
values(9780275965075, "The Catcher in the Rye", 1951, 'Fiction');
insert into authors(author_id, author_first, author_last)
values(30262, "Jerome", "Salinger");
insert into written_by(ISBN, author_id)
values (9780275965075,30262);

-- To Kill a Mockingbird
insert into books()
values(9780060935467, "To Kill a Mockingbird", 1960, 'Fiction');
insert into authors()
values(95962, "Harper", "Lee");
insert into written_by()
values (9780060935467,95962);

-- Jane Eyre
insert into books()
values(9780486424491, "Jane Eyre", 1847, 'Fiction');
insert into authors()
values(94578, "Charlotte", "Bronte");
insert into written_by()
values (9780486424491,94578);

-- Mody-Dick
insert into books()
values(9798354570416, "Moby-Dick", 1851, 'Fiction');
insert into authors()
values(04795, "Herman", "Melville");
insert into written_by()
values (9798354570416,04795);

-- Hamlet
insert into books()
values(9798497796773, "Hamlet", 1603, 'Tragedy');
insert into authors()
values(59769, "William", "Shakespeare");
insert into written_by()
values (9798497796773,59769);

-- War and Peace
insert into books()
values(9780486816432, "War and Peace", 1867, 'Fiction');
insert into authors()
values(16623, "Leo", "Tolstoy");
insert into written_by()
values (9780486816432,16623);

-- Wuthering Heights
insert into books()
values(9781505313499, "Wuthering Heights", 1847, 'Tragedy');
insert into authors(author_id, author_first, author_last)
values(05868, "Emily", "Bronte");
insert into written_by()
values (9781505313499,05868);

-- The Grapes of Wrath
insert into books()
values(9780143039433, "The Grapes of Wrath", 1939, 'Historical Fiction');
insert into authors(author_id, author_first, author_last)
values(19085, "John", "Steinbeck");
insert into written_by()
values (9780143039433,19085);

-- Gulliver's Travels
insert into books()
values(9781514699409, "Gulliver's Travels", 1726, 'Fantasy');
insert into authors(author_id, author_first, author_last)
values(89972, "Jonathan", "Swift");
insert into written_by()
values (9781514699409,89972);

-- Things Fall Apart
insert into books()
values(9780385474542, "Things Fall Apart", 1958, 'Historical Fiction');
insert into authors()
values(20491, "Chinua", "Achebe");
insert into written_by()
values (9780385474542,20491);

-- Frankenstein
insert into books()
values(9781512308051, "Frankenstein", 1818, 'Science Fiction');
insert into authors()
values(91913, "Mary", "Shelly");
insert into written_by()
values (9781512308051,91913);

-- Animal Farm
insert into books()
values(9780451526342, "Animal Farm", 1945, 'Satire');
insert into authors()
values(33849, "George", "Orwell");
insert into written_by()
values (9780451526342,33849);

-- A Clockwork Orange
insert into books()
values(9780393341768, "Clockwork Orange", 1962, 'Science Fiction');
insert into authors()
values(98514, "Anthony", "Burgess");
insert into written_by()
values (9780393341768,98514);

-- The Da Vinci Code
insert into books()
values(9780274808328, "The Da Vinci Code", 2003, 'Mystery');
insert into authors()
values(04073, "Dan", "Brown");
insert into written_by()
values (9780274808328,04073);

-- The Handmaid's Tale
insert into books()
values(9780385490818, "The Handmaid's Tale", 1985, 'Fiction');
insert into authors()
values(54878, "Margaret", "Atwood");
insert into written_by()
values (9780385490818,54878);

-- 1984
insert into books()
values(9780451524935, "1984", 1949, 'Science Fiction');
insert into written_by()
values (9780451524935,33849);

-- Pride and Prejudice
insert into books()
values(9798510407075, "Pride and Prejudice", 1813, 'Romance');
insert into authors()
values(14908, "Jane", "Austen");
insert into written_by()
values (9798510407075,14908);

-- Fahrenheit 451
insert into books()
values(9781451673319, "Fahrenheit 451", 1953, 'Science Fiction');
insert into authors()
values(44896, "Ray", "Bradbury");
insert into written_by()
values (9781451673319,44896);

-- Life of Pi
insert into books()
values(9780156027328, "Life of Pi", 2001, 'Fiction');
insert into authors()
values(45021, "Yann", "Martel");
insert into written_by()
values (9780156027328,45021);


-- Adding Lib Card and Borrower Information(20)
insert into lib_card(lib_card_id, activation_date)
values (1000001, '2019-01-01');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(58308, "Pachava", "Abhignya", 1243496715, "abhignya.p@northeastern.edu",1000001,1);

insert into lib_card(lib_card_id, activation_date)
values (1000002, '2019-01-09');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(55684, "Bishal", "Agrawal", 8289724744, "agrawal.b@northeastern.edu",1000002,3);

insert into lib_card(lib_card_id, activation_date)
values (1000003, '2019-01-23');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email,lib_card_id, home_branch_num)
values(12247, "Michael", "Aldoroty", 9091876398, "aldoroty.m@northeastern.edu",1000003,2);

insert into lib_card(lib_card_id, activation_date)
values (1000004, '2019-01-30');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(78032, "Joseph", "Entner", 8811004986, "entner.j@northeastern.edu",1000004,4);

insert into lib_card(lib_card_id, activation_date)
values (1000005, '2019-01-30');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(87483, "Harshan", "Ganugula", 8675507238, "ganugla.h@northeastern.edu", 1000005,7);

insert into lib_card(lib_card_id, activation_date)
values (1000006, '2019-01-31');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(79994, "Christopher", "Hadler", 9922971293, "hadler.c@northeastern.edu", 1000006,5);

insert into lib_card(lib_card_id, activation_date)
values (1000007, '2019-02-20');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(79847, "Thomas", "Hayden", 8024193902, "hayden.t@northeastern.edu", 1000007,3);

insert into lib_card(lib_card_id, activation_date)
values (1000008, '2019-03-31');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(23872, "Mehul", "Jain", 7725869393, "mehul.j@northeastern.edu", 1000008,9);

insert into lib_card(lib_card_id, activation_date)
values (1000009, '2019-07-28');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(10085, "Sean", "Klein", 6166930806, "klein.s@northeastern.edu", 1000009,10);

insert into lib_card(lib_card_id, activation_date)
values (1000010, '2019-06-10');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(68270, "Serena", "Lakhiani", 1118040294, "lakhiani.s@northeastern.edu", 1000010,8);

insert into lib_card(lib_card_id, activation_date)
values (1000011, '2019-09-30');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(61947, "Nidhi", "Mankala", 5474629221, "mankala.n@northeastern.edu", 1000011,7);

insert into lib_card(lib_card_id, activation_date)
values (1000012, '2019-10-12');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(95477, "Qiyue", "Mao", 9860780041, "mao.q@northeastern.edu", 1000012,2);

insert into lib_card(lib_card_id, activation_date)
values (1000013, '2020-01-12');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(78170, "Bhavitha", "Meka", 7633769303, "meka.b@northeastern.edu", 1000013,1);

insert into lib_card(lib_card_id, activation_date)
values (1000014, '2020-10-01');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(21272, "Ataish", "Nehra", 3835233264, "nehra.a@northeastern.edu", 1000014,9);

insert into lib_card(lib_card_id, activation_date)
values (1000015, '2021-02-04');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(92220, "Sijing", "Peng", 8801579709, "peng.s@northeastern.edu", 1000015,8);

insert into lib_card(lib_card_id, activation_date)
values (1000016, '2021-03-12');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(73335, "Arya", "Shukla", 1348560458, "shukla.a@northeastern.edu", 1000016,6);

insert into lib_card(lib_card_id, activation_date)
values (1000017, '2021-03-25');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(35279, "Hamza", "Tahboub", 9829851756, "tahboub.h@northeastern.edu", 1000017,3);

insert into lib_card(lib_card_id, activation_date)
values (1000018, '2021-04-15');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(80157, "Yishui", "Tian", 6839652933, "tian.y@northeastern.edu", 1000018,2);

insert into lib_card(lib_card_id, activation_date)
values (1000019, '2021-05-01');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(32176, "Kartik", "Tickoo", 7997319498, "tickoo.k@northeastern.edu",1000019,4);

insert into lib_card(lib_card_id, activation_date)
values (1000020, '2021-05-22');
insert into borrower(borrower_id, borrower_first, borrower_last, phone, email, lib_card_id, home_branch_num)
values(05529, "Shivansh", "Verma", 5040681458, "verma.s@northeastern.edu", 1000020,8);

-- Book Copies
insert into book_copies(ISBN, branch_num, availability)
values (9798745274824,1,'Available'),(9798745274824,2,'Available'),(9798745274824,4,'Available'),(9798745274824,7,'Available'),(9798745274824,10,'Available'),
(9780275965075,3,'Available'),(9780275965075,4,'Available'),(9780275965075,6,'Available'),(9780275965075,9,'Available'),
(9780060935467,8,'Available'),(9780060935467,7,'Available'),(9780060935467,6,'Available'),(9780060935467,4,'Available'),(9780060935467,1,'Available'),
(9780486424491,3,'Available'),(9780486424491,2,'Available'),
(9798354570416,6,'Available'),(9798354570416,7,'Available'),
(9798497796773,10,'Available'),
(9780486816432,9,'Available'),(9780486816432,1,'Available'),(9780486816432,2,'Available'),
(9781505313499,4,'Available'),
(9780143039433,8,'Available'),
(9781514699409,6,'Available'),
(9780385474542,3,'Available'),(9780385474542,5,'Available'),
(9781512308051,7,'Available'),
(9780451526342,1,'Available'), (9780451526342,9,'Available'),
(9780393341768,6,'Available'),
(9780274808328,7,'Available'),(9780274808328,1,'Available'),
(9780385490818,4,'Available'),(9780385490818,1,'Available'),
(9780451524935,1,'Available'),
(9798510407075,5,'Available'),
(9781451673319,5,'Available'),
(9780156027328,5,'Available'),(9780156027328,5,'Available'),(9780156027328,6,'Available');

-- Insertions into loans
insert into loans(borrower_id, ISBN, copy_num, borrow_date)
values (58308,9798745274824,1,'2022-01-01'),
(58308,9780275965075,7,'2022-05-01'),
(58308,9780486816432,21,'2022-09-10'),
(55684,9798354570416,18,'2022-10-01'),
(55684,9780385474542,27,'2022-10-02'),
(12247,9798354570416,19,'2022-10-30'),
(78032,9798745274824,1,'2022-11-01'),
(12247,9798745274824,2,'2022-11-02'),
(79994,9798745274824,3,'2022-11-03'),
(79847,9798745274824,4,'2022-11-04'),
(32176,9780385490818,34,'2022-11-04'),
(23872,9798745274824,5,'2022-11-05'),
(95477,9780275965075,6,'2022-11-05'),
(92220,9780060935467,10,'2022-11-05'),
(10085,9798745274824,6,'2022-11-05'),
(61947,9780060935467,11,'2022-11-06'),
(32176,9780486424491,15,'2022-11-06'),
(12247,9780060935467,12,'2022-11-06'),
(92220,9780060935467,8,'2022-11-07'),
(32176,9780156027328,39,'2022-11-07'),
(80157,9798354570416,17,'2022-11-07'),
(92220,9781451673319,38,'2022-11-07'),
(35279,9780486816432,20,'2022-11-07'),
(10085,9780143039433,25,'2022-11-08'),
(58308,9780275965075,6,'2022-11-08'),
(79994,9780385474542,26,'2022-11-08'),
(32176,9781512308051,28,'2022-11-08'),
(23872,9780393341768,31,'2022-11-08'),
(95477,9780274808328,33,'2022-11-09'),
(80157,9780451524935,36,'2022-11-09'),
(79994,9798510407075,37,'2022-11-09'),
(87483,9780060935467,9,'2022-11-10'),
(68270,9780486424491,16,'2022-11-10'),
(78170,9780060935467,12,'2022-11-10'),
(73335,9780275965075,7,'2022-11-10'),
(21272,9780060935467,13,'2022-11-11'),
(68270,9780486816432,22,'2022-11-11'),
(32176,9781505313499,23,'2022-11-12'),
(87483,9780060935467,14,'2022-11-13'),
(10085,9780451526342,29,'2022-11-13'),
(68270,9780156027328,40,'2022-11-13'),
(35279,9780486816432,20,'2022-11-20');

-- Insertions into holds (everyone has to read The Great Gatsby for school but all copies are checked out!)
insert into holds(borrower_id, isbn, hold_date)
values (68270,9798745274824, '2022-11-07'),
(61947,9798745274824, '2022-11-07'),
(95477,9798745274824, '2022-11-08'),
(78170,9798745274824, '2022-11-08'),
(21272,9798745274824, '2022-11-08'),
(92220,9798745274824, '2022-11-09'),
(73335,9798745274824, '2022-11-09'),
(35279,9798745274824, '2022-11-09'),
(80157,9798745274824, '2022-11-10'),
(32176,9798745274824, '2022-11-10');

-- Insertions into returned_book
insert into returned_book(loan_id, return_date, branch_num)
values (1,'2022-01-17',4),
(2,'2022-05-13',4),
(3,'2022-09-26',3),
(4,'2022-10-15',2),
(5,'2022-10-17',1),
(6,'2022-11-15',10),
(7,'2022-11-15',9),
(8,'2022-11-17',7),
(9,'2022-11-17',7),
(10,'2022-11-18',8),
(11,'2022-11-18',5),
(12,'2022-11-18',5),
(13,'2022-11-19',7),
(14,'2022-11-18',3),
(15,'2022-11-20',2),
(16,'2022-11-16',9),
(17,'2022-11-21',10),
(18,'2022-11-18',5),
(19,'2022-11-22',1),
(20,'2022-11-21',4),
(21,'2022-11-20',4),
(22,'2022-11-23',1),
(23,'2022-11-19',5),
(24,'2022-11-25',5),
(25,'2022-11-25',2),
(26,'2022-11-20',3),
(27,'2022-11-22',7),
(28,'2022-11-25',9),
(29,'2022-11-20',10),
(30,'2022-11-22',8),
(31,'2022-11-23',8),
(32,'2022-11-23',6),
(33,'2022-11-28',5),
(34,'2022-11-27',2),
(35,'2022-11-22',2),
(36,'2022-11-27',7),
(37,'2022-11-24',6),
(38,'2022-11-30',1),
(39,'2022-11-29',7),
(40,'2022-11-26',9),
(41,'2022-11-27',8);

-- Insertions into fines is automatic based on due date/return date

-- Insertions into fine_payment
insert into fine_payment (fine_id, amount_paid, payment_date, transaction_type)
values (1, 2.5,'2022-01-25', 'Credit'),
(2, 2.5,'2022-10-01', 'Credit'),
(3, 2.5,'2022-10-25', 'Cash'),
(4, 2.5,'2022-11-18', 'Credit'),
(5,2.5,'2022-11-20', 'Cash'),
(6, 2.5,'2022-11-21', 'Credit'),
(7, 2.5,'2022-11-24', 'Cash'),
(8, 2.5,'2022-11-28', 'Credit'),
(9, 2.5,'2022-11-27', 'Credit'),
(10, 2.5,'2022-11-29', 'Cash'),
(11, 2.5,'2022-11-30', 'Cash'),
(12, 2.5,'2022-12-01', 'Credit'),
(13, 2.5,'2022-12-01', 'Cash'),
(15, 2.5,'2022-12-02', 'Credit'),
(17, 2.5,'2022-11-30', 'Credit');

-- INSERT LATER:
-- insertion into loans that are still checked out (verify update on checkout trigger)
insert into loans(borrower_id, ISBN, copy_num, borrow_date)
values (10085,9780143039433,25,'2022-11-21'),
(58308,9780275965075,6,'2022-11-25'),
(95477,9780385474542,26,'2022-11-28'),
(80157,9781512308051,28,'2022-11-30'),
(23872,9780393341768,31,'2022-12-01'),
(80157,9780274808328,33,'2022-12-02'),
(32176,9780451524935,36,'2022-12-02');
