rem EE 562 Project 2
rem Songrui Li
rem LI884

SET SERVEROUTPUT ON

@populate
@trg
@fun
@pro
-- Execution phase #1
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('1 -- Populate the Books, Author and Borrower tables');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

end;
/




-- Execution phase #2
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('2 -- Execute all the triggers');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

end;
/




-- Execution phase #3
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('3 - Use the function fun_issue_book() to populate the Issue and Pending_request tables');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(1,1, to_date(''02/10/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(2,2, to_date(''02/10/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(3,3, to_date(''02/10/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(4,4, to_date(''02/10/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(5,5, to_date(''02/10/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(6,6, to_date(''02/10/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(7,1, to_date(''02/11/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(8,2, to_date(''02/12/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(9,3, to_date(''02/13/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(10,4, to_date(''02/14/03'',''MM/DD/YY'')));');

DBMS_OUTPUT.PUT_LINE('(fun_issue_book(11,10, to_date(''02/15/03'',''MM/DD/YY'')));');

end;
/


EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(1,1, to_date('02/10/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(2,2, to_date('02/10/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(3,3, to_date('02/10/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(4,4, to_date('02/10/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(5,5, to_date('02/10/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(6,6, to_date('02/10/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(7,1, to_date('02/11/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(8,2, to_date('02/12/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(9,3, to_date('02/13/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(10,4, to_date('02/14/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_book(11,10, to_date('02/15/03','MM/DD/YY')));




-- Execution phase #4

begin


DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('4 - Use the function fun_issue_anyedition() to insert the following records in your sample database for testing. This function must take all the four parameters.');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(2,''DATA MANAGEMENT'',''C.J.DATES'',to_date(''3/3/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(4,''CALCULUS'',''H.ANTON'',to_date(''3/4/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(5,''ORACLE'',''ORACLE PRESS'',to_date(''3/4/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(10,''IEEE MULTIMEDIA'',''IEEE'',to_date(''2/27/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(2,''MIS MANAGEMENT'',''C.J.CATES'',to_date(''5/3/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(4,''CALCULUS II'',''H. ANTON'',to_date(''3/4/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(10,''ORACLE'',''ORACLE PRESS'',to_date(''3/4/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(5,''IEEE MULTIMEDIA'',''IEEE'',to_date(''2/26/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(2,''DATA STRUCTURE'',''W.GATES'',to_date(''3/3/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(4,''CALCULUS III'',''H.ANTON'',to_date(''4/4/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(11,''ORACLE'',''ORACLE PRESS'',to_date(''3/8/03'',''MM/DD/YY'')));');
DBMS_OUTPUT.PUT_LINE('(fun_issue_anyedition(6,''IEEE MULTIMEDIA'',''IEEE'',to_date(''2/17/03'',''MM/DD/YY'')));');


end;
/


EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(2,'DATA MANAGEMENT','C.J. DATES',to_date('3/3/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(4,'CALCULUS','H. ANTON',to_date('3/4/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(5,'ORACLE','ORACLE PRESS',to_date('3/4/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(10,'IEEE MULTIMEDIA','IEEE',to_date('2/27/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(2,'MIS MANAGEMENT','C.J. CATES',to_date('5/3/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(4,'CALCULUS II','H. ANTON',to_date('3/4/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(10,'ORACLE','ORACLE PRESS',to_date('3/4/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(5,'IEEE MULTIMEDIA','IEEE',to_date('2/26/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(2,'DATA STRUCTURE','W. GATES',to_date('3/3/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(4,'CALCULUS III','H. ANTON',to_date('4/4/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(11,'ORACLE','ORACLE PRESS',to_date('3/8/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_issue_anyedition(6,'IEEE MULTIMEDIA','IEEE',to_date('2/17/03','MM/DD/YY')));




-- Execution phase #5
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('5 -- Execute pro_print_borrower');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

pro_print_borrower;
-- Execution phase #6

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('6 -- Execute pro_print_fine');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

pro_print_fine(to_date('02/28/03','MM/DD/YY'));


end;
/
-- Execution phase #7
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('7 -- Return books 1,2,4 and 10');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');


end;
/


EXEC DBMS_OUTPUT.PUT_LINE(fun_return_book(1,to_date('02/28/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_return_book(2,to_date('02/28/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_return_book(4,to_date('02/28/03','MM/DD/YY')));
EXEC DBMS_OUTPUT.PUT_LINE(fun_return_book(10,to_date('02/28/03','MM/DD/YY')));

-- Execution phase #8
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('8 -- Print the peding_request and issue tables');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

end;
/

SELECT* FROM Pending_request;
SELECT* FROM Issue;



-- Execution phase #9
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('9 -- Execute pro_listborr_mon for the month of February and March');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');


pro_listborr_mon(1,'FEB');
pro_listborr_mon(1,'MAR');

end;
/

-- Execution phase #10
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('10 -- Execute pro_listborr.');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

pro_listborr;

end;
/


-- Execution phase #11
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('11 -- Execute pro_list_popular.');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

pro_list_popular;

end;
/

-- Execution phase #12
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('12 -- Print the average tiime a requester waits in the Pending_request table.');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

end;
/

SELECT AVG(P.Issue_date-P.request_date) as AVERAGE_WAIT
FROM Pending_request P;


-- Execution phase #13
begin

DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('13 -- Print the name and the borrower_id of the person who has waited the longest amount of time for any book.');
DBMS_OUTPUT.PUT_LINE('====================================================================================');
DBMS_OUTPUT.PUT_LINE('      ');

end;
/


SELECT B.name, B.borrower_id
FROM Pending_request P, Borrower B
WHERE issue_date-request_date=(SELECT max(issue_date-request_date)
			       FROM Pending_request) AND P.requester_id=B.borrower_id;
