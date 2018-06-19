rem EE 562 Project 2
rem Songrui Li
rem LI884



-- Step #1: create Books table.
CREATE TABLE Books 
(
	book_id number PRIMARY KEY,
	book_title varchar2(50),
	author_id number,
	year_of_publication number,
	edition number,
	status varchar2(20)
);

-- Step #2: create Author table.
CREATE TABLE Author
(
	author_id number PRIMARY KEY,
	Name varchar2(30)
);

--Step #3: create Borrower table.
CREATE TABLE Borrower
(
	borrower_id number PRIMARY KEY,
	name varchar2(30),
	status varchar2(20)
);

--Step #4: create Issue table.
CREATE TABLE Issue
( 
	book_id number,
	borrower_id number,
	issue_date date,
	return_date date,
	PRIMARY KEY (book_id, borrower_id,issue_date)
);

--Step #5: create Pending_request table.
CREATE TABLE Pending_request
(
	book_id number,
	requester_id number,
	request_date date,
	issue_date date,
	PRIMARY KEY (book_id, requester_id, request_date)
);


--Rule #1
Alter table Books add constraint CHK_Books_status check (status in ('charged','not charged'));

--Rule #2
Alter table Borrower add constraint CHK_Borrower_status check (status in ('student','faculty')); 

--END


