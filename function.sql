rem EE 562 Project 2
rem Songrui Li
rem LI884

set SERVEROUTPUT ON


-- Function #1 fun_issue_book
create or replace function fun_issue_book
	(borrower_id IN number, b_id IN number, currentdate IN date)
return number
IS
x varchar2(20);

begin
	select b.status into x  
	from Books b
	where b.book_id=b_id;

	if (x='not charged')
	then 
		insert into Issue values (b_id, borrower_id, currentdate, NULL);
	 return 1;
	elsif (x='charged')
	then 
		insert into Pending_request values (b_id, borrower_id, currentdate,NULL);
	 return 0;

	end if;

end;
/




-- Function #2 fun_issue_anyedition
create or replace function fun_issue_anyedition
	(bor_id IN number, book_title IN varchar2, author_name IN varchar2, currentdate IN date)
return number

IS 
 	
x number;
y number;
z number;
		
begin
	begin
	select b.book_id into x
	from Books b, Author a
	where b.status!='charged'
	and a.Name=author_name 	
	and b.author_id=a.author_id
	and b.book_title=book_title
	and b.edition=(select MAX(b1.edition)
		       from Books b1, Author a1
		       where b1.status!='charged' 
		       and b1.author_id=a1.author_id
		       and a1.name=author_name 
		       and b1.book_title=book_title);
		       
		      
	exception
	when no_data_found then
	x :=NULL;
	end;

	begin
	select MAX(i.book_id) into y
	from Issue i, Books b3, Author a3
	where b3.book_title=book_title 
	and a3.Name=author_name 
	and i.return_date is NULL
	and i.book_id=b3.book_id 
	and b3.author_id=a3.author_id     
	and i.issue_date <= ALL (select i1.issue_date
				 from Issue i1, Books b2, Author a2
				 where b2.book_title=book_title
				 and b2.book_id=i1.book_id 
				 and a2.Name=author_name 
				 and i1.return_date is NULL
			         and a2.author_id=b2.author_id  
				 );

	exception
	when no_data_found then
	y :=NULL;
	end;

	if x is NULL
	then
	z :=fun_issue_book(bor_id,y, currentdate);
	return 0;
	elsif x is not NULL
	then
	insert into Issue values(x, bor_id, currentdate, NULL);
	return 1;
	
	end if;
end;
/




-- Function #3 fun_most_popular
create or replace function fun_most_popular
	(month IN varchar2)
return number

IS 
x varchar2(50);
y number;
z number;

l_return SYS_REFCURSOR;

begin
DBMS_OUTPUT.PUT_LINE('Most popular book :');


	OPEN l_return FOR
 
		select i.book_id, extract(year from i.issue_date) AS year
		from Issue i
		where extract(month from i.issue_date)=x 
		and (extract(year from i.issue_date) IN(select extract(year from i1.issue_date)
		from Issue i1
		where extract(month from i1.issue_date)=x))
		group by i.book_id, extract(year from i.issue_date)
		having COUNT(*)>= ALL (select COUNT(*)
				       from Issue i2
				       where extract(month 
				       from i2.issue_date)=x 
				       and extract(year from i2.issue_date)=extract(year from i.issue_date)
	 			       group by i2.book_id)
		order by extract(year from i.issue_date);


LOOP
fetch l_return into y,z;
exit when l_return%notfound;
DBMS_OUTPUT.PUT_LINE('Book Id:'||y||' '||month||' '||z);
end LOOP;

return 0;

end fun_most_popular;
/


-- Function #4 fun_return_book
create or replace function fun_return_book
	(b_id number, r_date date)
return number

IS
x number;
	

begin
	begin
	select p.requester_id into x
	from Pending_request p
	where p.book_id=b_id 
	and p.Issue_date is NULL 
	and p.request_date=(select MIN(p1.request_date) 
			    from Pending_request p1 
			    where p1.book_id=b_id 
			    and p1.Issue_date is NULL);
	
	exception
	when no_data_found then
	x :=NULL;
	end;



	if x is NULL 
	then
		update Issue
		set return_date=r_date
		where book_id=b_id and return_date is NULL; 
		return 1;
	elsif x is not NULL
	then
		update Issue
		set return_date=r_date
		where book_id=b_id 
		and return_date is NULL;
		insert into Issue values (b_id, x, r_date, NULL);
		update Pending_request 
		set Issue_date=r_date
		where requester_id=x 
		and book_id=b_id 
		and Issue_date is NULL;
		
		return 0;
	end if;

end;
/





