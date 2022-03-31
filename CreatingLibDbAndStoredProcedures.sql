create database db_library

use db_library

--LIBRARY BRANCH

create table tbl_lib_branch(
BranchID int primary key not null identity(1000,10), --primary key
BranchName varchar(50),
Address varchar(100)
);

alter table tbl_lib_branch
drop column Address;

alter table tbl_lib_branch
add BranchAddress varchar(75);

select*
from tbl_lib_branch

--Inserting rows

insert into tbl_lib_branch(BranchName,BranchAddress)
values
('Sharpstown', '123 Main St, Perth, 6000, WA'),
('Capel', '20 Join St, Capel, 6010, WA'),
('Kalgoorlie', '16 Main St, Kalgoorlie, 6412, WA'),
('Wanneroo', '145 Wanneroo Rd, Wanneroo, 6512, WA'),
('Ellensbrook', '1 Ellensbrook Rd, Ellensbrook, 6321, WA'),
('Lesmurdie', '1 Falls Rd, Lesmurdie, 6521, WA')
;


select *
from tbl_lib_branch

--LIBRARY BOOK COPY

create table tbl_lib_book_copy(
BookID int,  -- foriegn key
BranchID int, --foriegn key
Number_Of_Copies int
);
alter table tbl_lib_book_copy
add foreign key (BookID) references tbl_lib_books(BookID);

alter table tbl_lib_book_copy
add foreign key (BranchID) references tbl_lib_branch(BranchID);

select *
from tbl_lib_book_copy

insert into tbl_lib_book_copy(BookID, BranchID,Number_Of_Copies)
values
(1, 1000, 4),
(2, 1010, 2),
(3, 1020, 2),
(4, 1030, 4),
(5, 1040,2),
(6, 1050, 4),
(7, 1010, 4),
(8,1020, 3),
(9, 1030, 3),
(10, 1020,2);

select* from tbl_lib_book_copy

--LIBRARY BOOKS

create table tbl_lib_books(
BookID int primary key not null identity (1,1), -- primary key
Title varchar(50),
PublisherName varchar(50)
);

insert into tbl_lib_books(Title, PublisherName)
values

('The Lost Tribe', 'Brumby West'),
('Westin Price Keto Diet', 'Melissa Price'),
('The Last Samuri', 'Joseph Poe'),
('Grease', 'June Slither'),
('The Great Divide', 'Wendy Whaller'),
('Wallice the Dog', 'Sally June'),
('Joseph, and his Life', 'Westin Price'),
('Batman', 'Janet Jones'),
('Salty Lake', 'Sandy Snow'),
('Ants Under the Chopping Board', 'Wendy Whaller')
;

select *
from tbl_lib_books;


--LIBRARY BOOK AUTHORS

create table tbl_lib_book_authors(
BookID int, --foriegn key
AuthorName varchar(50)
);

alter table tbl_lib_book_authors
add foreign key (BookID) references tbl_lib_books(BookID);

insert into tbl_lib_book_authors(BookID, AuthorName)
values
(1,'Lizzy Lioni'),
(2,'Lizzy Lioni'),
(5,'Lizzy Lioni'),
(4,'Brian Adams'),
(3,'Jason Kelly'),
(6,'Wilbur Smith'),
(8,'Herman Hesse'),
(7,'Wilbur Smith'),
(10,'Tolkien'),
(9,'Tolkien')
;

select * 
from tbl_lib_book_authors


--LIBRARY BOOK BORROWER

create table tbl_lib_borrower(
CardNo int primary key not null identity (1,1), --primary key
BName varchar(50),
BAddress varchar(50),
BPhone varchar(50)
);

insert into tbl_lib_borrower(  BName, BAddress, BPhone)
values

('Bob Smith', '8 Low Rd, Kalamunda, 6062  WA', '0456-6210-0214'),
('Jane Brown', '8 Slough Rd, Perth, 6000  WA', '0456-6550-0214'),
('Mark Jones', '87 High Rd, Peel, 6692  WA', '0445-6790-0474'),
('Wendy Adams', '21 Slow Rd, Armadale, 6162  WA', '0451-3310-0254'),
('Sreni Bloe', '24 Sun Rd, Burns Beach, 6472  WA', '0896-6980-0474'),
('Kelly Lowe', '453 Main St, Wanneroo, 6342  WA', '0556-9910-0984'),
('Sharon Pal', '169 Geeves Rd, Bells, 6962  WA', '0986-6254-0474'),
('Tristan Chopping', '192 Kelly Rd, Morley, 6782  WA', '0426-1210-9814')
;

select *
from tbl_lib_borrower;

--LIBRARY BOOK LOANS

create table tbl_book_loans(
BookID int,  --foriegn key
BranchID int,  --foriegn key
CardNo int,-- foriegn key
DateOut date,
DateDue date
);

alter table tbl_book_loans
add foreign key (BookID) references tbl_lib_books(BookID);

alter table tbl_book_loans
add foreign key (BranchID) references tbl_lib_branch(BranchID);

alter table tbl_book_loans
add foreign key (CardNo) references tbl_lib_borrower(CardNo);

insert into tbl_book_loans(BookID, BranchID, CardNo, DateOut, DateDue)
values

(4, 1010, 1, '2021-03-20', '2021-03-27'),
(1, 1020, 1, '2021-03-20', '2021-03-27'),
(2, 1030, 1, '2021-03-20', '2021-03-27'),
(3, 1040, 2, '2021-03-21', '2021-03-28'),
(6, 1010, 2, '2021-03-21', '2021-03-28'),
(7, 1020, 6, '2021-03-20', '2021-03-27'),
(7, 1030, 6, '2021-03-20', '2021-03-27'),
(8, 1040, 7, '2021-03-20', '2021-03-27'),
(9, 1050, 7, '2021-03-20', '2021-03-27'),
(10, 1040, 8, '2021-03-20', '2021-03-27')
;

select *
from tbl_book_loans



--LIBRARY BOOK PUBLISHERS

create table tbl_publisher(
PublisherName varchar(50) not null primary key, --primary key
PubAddress varchar(50),
PubPhone varchar(50)
);

insert into tbl_publisher(PublisherName, PubAddress, PubPhone)
values

('Brumby West Publishers', '8 Lowe Rd, Kalamunda, 6062  WA', '0456-6550-4214'),
('Westin Price Publishers', '89 Rainbow Rd, Perth, 6124  WA', '0516-6400-0214'),
('Sandy Snow Books', '897 Prince Rd, Geraldton, 6060  WA', '0786-6287-7814'),
('June Publishing House', '145 Jump Rd, Morley, 6012  WA', '7826-8750-7804'),
('Janet Books House', '62 Winter Rd, Peley 6492  WA', '0785-6690-0474'),
('Wendy Whaller Printing House', '212 Turner Rd, Cottesloe, 6160  WA', '0781-3890-0254'),
('Joseph Publishers', '214 Summer Rd, Jersey Beach, 6372  WA', '0496-6280-0474'),
('Melissa Price Books', '1 Main St, Winterland, 6962  WA', '0556-9120-0874'),
('Sally Book House', '56 Peeves Rd, Belleiars, 6762  WA', '8386-6254-0474'),
('Anita/s Printing House', '172 Keles Rd, Mallibu, 6782  WA', '0486-1210-9814')
;

select *
from tbl_publisher;

select * from ((tbl_book_loans full outer join tbl_lib_borrower on tbl_book_loans.CardNo=tbl_lib_borrower.CardNo) full outer join tbl_lib_books on tbl_book_loans.BookID = tbl_lib_books.BookID)

select Title, BookID
from tbl_lib_books

select *
from tbl_lib_books

select tbl_lib_books.Title, tbl_lib_book_authors.AuthorName
from tbl_lib_books
right Join tbl_lib_book_authors
on tbl_lib_books.BookID=tbl_lib_book_authors.BookID;



tbl_lib_book_authors.AuthorName, tbl_lib_book_authors.BookID
from (full right join tbl_lib_books.BookID = tbl_lib_book_authors.BookID)

--creating stored procedure which answers question "How many copies of "The Lost Tribe" are owned by Sharpstown.

create proc dbo.usp_Get_Copies_Data_Book_Name_Branch_Name
	as
	begin

		select Number_Of_Copies, Title, BranchName from ((tbl_lib_book_copy full outer join tbl_lib_branch on tbl_lib_book_copy.BranchID= tbl_lib_branch.BranchID)
		full outer join tbl_lib_books on tbl_lib_book_copy.BookID = tbl_lib_books.BookID)


		where tbl_lib_books.Title = 'Grease' and tbl_lib_branch.BranchName = 'Ellensbrook' --clause defines what book title and what branch (by name)

	end

	exec dbo.usp_Get_Copies_Data_Book_Name_Branch_Name;