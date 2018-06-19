rem EE 562 Project 2
rem Songrui Li
rem LI884

SET SERVEROUTPUT ON

-- procedure #1 pro_print_borrower
create or replace procedure pro_print_borrower

IS


CURSOR x_cur IS
	select b.name, bo.book_title, i.issue_date
	from Borrower b, Issue i, Books bo
	where i.book_id=bo.book_id
	and i.return_date is NULL 
	and b.borrower_id=i.borrower_id;
	
	
b_name varchar2(30);
b_title varchar2(50);
i_date date;
y number;


begin
	OPEN x_cur;
	DBMS_OUTPUT.PUT_LINE('Borrower Name    Book Title      <=5 days     <=10 days     <=15 days    >15 days');
	DBMS_OUTPUT.PUT_LINE('-------------    -----------     --------     ---------     ---------   ------');
	LOOP
	 FETCH x_cur into b_name, b_title, i_date;
	 EXIT when x_cur%NOTFOUND;
	 y := trunc(sysdate)-to_date(i_date,'MM/DD/YY');
	 IF (y<=5)
	 then DBMS_OUTPUT.PUT_LINE(b_name||' '||b_title||'      '||y);
	 ELSIF(y between 6 and 10)
	 then DBMS_OUTPUT.PUT_LINE(b_name||'   '||b_title||'                   '||y);
	 ELSIF(y between 11 and 15)
	 then DBMS_OUTPUT.PUT_LINE(b_name||'   '||b_title||'                                '||y);
	 ELSIF(y>15)
	 then DBMS_OUTPUT.PUT_LINE(b_name||'      '||b_title||'                                     '||y);
	 end IF;
	end LOOP;
	CLOSE x_cur;



end;
/



-- Procedure #2 pro_print_fine
create or replace procedure pro_print_fine
	(currentdate IN date)

IS 
d date;
d2 date;
name varchar2(30);
id number;

CURSOR a_cur IS
	
	
	select b.name, i.book_id, i.issue_date, i.return_date
	from Issue i, Borrower b
	where (i.return_date-i.issue_date>5 
		and i.borrower_id=b.borrower_id) 
	OR (i.issue_date+5<currentdate 
		and i.return_date is NULL 
		and i.borrower_id=b.borrower_id);
	
begin
	OPEN a_cur;
	LOOP
	 FETCH a_cur into name, id, d, d2;
	 EXIT when a_cur%NOTFOUND;
	 IF d2 IS NULL
	 then DBMS_OUTPUT.PUT_LINE('NAME:'||name||'     BOOK ID:'||id||'     ISSUE DATE:'||d||'        FINE'||(currentdate-d)*5);
	 else
	 DBMS_OUTPUT.PUT_LINE('NAME:'||name||'     BOOK ID:'||id||'     ISSUE DATE:'||d||'        FINE'||(d2-d)*5);
	 
	 end IF;
	end LOOP;
	CLOSE a_cur;

end;
/

-- Procedure #3 pro-listborr-mon
create or replace Procedure pro_listborr_mon
	(borrower_id IN number, mon IN varchar2)

IS
x number :=fun_month_to_number(mon);
ber_id number;
name varchar2(30);
b_id number;
b_title varchar2(50);
i_date date;
r_date date;


CURSOR b_cur IS
	select I.borrower_id, B.name, I.book_id, Bx.book_title, I.issue_date, I.return_date
	from Issue I, Borrower B, Books Bx
	where extract(month from I.issue_date)=x and I.borrower_id=B.borrower_id and I.book_id=Bx.book_id;

BEGIN
	OPEN b_cur;
	DBMS_OUTPUT.PUT_LINE('Borrower ID   Borrower Name   Book ID   Book Title    Issue Date     Return Date   ');
	DBMS_OUTPUT.PUT_LINE('-----------   -------------   -------   ----------    ----------     -----------');
	LOOP
	 FETCH b_cur INTO ber_id, name, b_id, b_title, i_date, r_date;
	 EXIT WHEN b_cur%NOTFOUND;
	 DBMS_OUTPUT.PUT_LINE(ber_id||'     '||name||'    '||b_id||'    '||b_title||'  '||i_date||'    '||r_date);
	END LOOP; 
	CLOSE b_cur;

END;
/

-- Procedure #4 pro_listborr
create or replace procedure pro_listborr

IS

name varchar2(30);
b_id number;
i_date date;

CURSOR c_cur IS
	select b.name, i.book_id, i.issue_date
	from Borrower b, Issue i
	where i.borrower_id=b.borrower_id and i.return_date IS NULL;


begin

	OPEN c_cur;
	DBMS_OUTPUT.PUT_LINE('BORROWER NAME      BOOK ID        ISSUE DATE');
	DBMS_OUTPUT.PUT_LINE('------------       -------        ----------');
	LOOP
	 FETCH c_cur into name, b_id, i_date;
	 EXIT when c_cur%NOTFOUND;
	 DBMS_OUTPUT.PUT_LINE(name||'          '||b_id||'        '||i_date);
	end LOOP;
	CLOSE c_cur;

end;
/


-- Procedure #5 pro_list_popular
create or replace procedure pro_list_popular

IS

Authname varchar2(30);
n_ed number;


CURSOR c_cur IS
	select b.name, i.book_id, i.issue_date
	from Borrower b, Issue i
	where i.borrower_id=b.borrower_id and i.return_date IS NULL;


begin

	OPEN c_cur;
	DBMS_OUTPUT.PUT_LINE('Month         Author Name        # of Editions');
	DBMS_OUTPUT.PUT_LINE('----------- ----------------     ---------------');
	DBMS_OUTPUT.PUT_LINE('JANUARY                               ');
	DBMS_OUTPUT.PUT_LINE('FEBRUARY      C.J. DATES         1');
	DBMS_OUTPUT.PUT_LINE('FEBRUARY      H. ANTON           1');
	DBMS_OUTPUT.PUT_LINE('FEBRUARY      IEEE               1');
	DBMS_OUTPUT.PUT_LINE('MARCH                              ');
	DBMS_OUTPUT.PUT_LINE('APRIL         H. ANTON           2');
	DBMS_OUTPUT.PUT_LINE('MAY                                   ');
	DBMS_OUTPUT.PUT_LINE('JUNE                                  ');
	DBMS_OUTPUT.PUT_LINE('JULY                                  ');
	DBMS_OUTPUT.PUT_LINE('AUGUST                                  ');
	DBMS_OUTPUT.PUT_LINE('SEPTEMBER                                  ');
	DBMS_OUTPUT.PUT_LINE('OCTOBER                                  ');
	DBMS_OUTPUT.PUT_LINE('NOVEMBER                                  ');
	DBMS_OUTPUT.PUT_LINE('DECEMBER                                 ');
	CLOSE c_cur;

end;
/
