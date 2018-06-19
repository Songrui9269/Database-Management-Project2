rem EE 562 Project 2
rem Songrui Li
rem LI884 


--trigger #1

create or replace trigger trg_maxbooks
before insert on Issue 
for each row
declare
borrowerType Borrower.status%type;
numIssues integer;
begin
	select b.status into borrowerType
	from Borrower b
	where b.borrower_id = :NEW.borrower_id;

	select count(*) into numIssues
	from Issue i
	where i.borrower_id = :NEW.borrower_id;

	if borrowerType = 'student' and numIssues >= 2
	then
		raise_application_error(-20000,'No more books can be borrowd for this student.');
	end if;

	if borrowerType = 'faculty' and numIssues >= 3
	then
		raise_application_error(-20001,'No more books can be borrowd for this faculty.');
	end if;
end;
	
/



-- trigger #2

create or replace trigger trg_charge
after insert on Issue
for each row
begin
	update Books
	set status = 'charged'
	where book_id = :NEW.book_id;
end;

/



--trigger #3

create or replace trigger trg_notcharge
after update of return_date on Issue
for each row
begin
	update books
	set status = 'not charged'
	where book_id = :NEW.book_id;
end;

/



--trigger #4

create or replace trigger trg_renew
before insert on Pending_request
for each row
declare
numpendingrequest integer;
numbooksborrowed integer;
numrequestspending integer;
bookisalreadyborrowed integer;
bookisalreadyrequested integer;
bookStatus varchar2(20);

begin
	
	select count(*) into numbooksborrowed 
	from Issue i
	where i.borrower_id = :NEW.requester_id
	and i.return_date is NULL;

	select count(*) into bookisalreadyrequested 
	from Pending_request p
	where p.requester_id = :NEW.requester_id
	and p.book_id = :NEW.book_id
	and p.issue_date is NULL; 
		
	select count(*) into numrequestspending 
	from Pending_request p
	where p.requester_id = :NEW.requester_id
	and p.issue_date is NULL; 

	select count(*) into bookisalreadyborrowed 
	from Issue i
	where i.borrower_id = :NEW.requester_id
	and i.book_id = :NEW.book_id
	and i.return_date is NULL;

	select b.status into bookStatus
	from Books b
	where b.book_id = :NEW.book_id;

	if bookStatus = 'charged' and (numbooksborrowed + numrequestspending) > 6
	then
		raise_application_error(-20002,'The number of your borrowed books and requested books are equal or greater than 7.');
	elsif bookStatus = 'charged' and bookisalreadyrequested = 1
	then 
		raise_application_error(-20003,'You have been requested the book before.');
	elsif bookStatus = 'charged' and bookisalreadyborrowed = 1
	then 
		raise_application_error(-20003,'You cannot renew the book.');
	end if;

end;
/


			

