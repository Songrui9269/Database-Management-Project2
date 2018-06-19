rem EE 562 Project 2
rem Songrui Li
rem LI884


drop trigger trg_maxbooks;
drop trigger trg_charge;
drop trigger trg_notcharge;
drop trigger trg_renew;

drop function fun_issue_book;
drop function fun_issue_anyedition;
drop function fun_most_popular;
drop function fun_return_book;

drop procedure pro_print_borrower;
drop procedure pro_print_fine;
drop procedure pro_listborr_mon;
drop procedure pro_listborr;
drop procedure pro_list_popular;



drop table Issue;
drop table Pending_request;
drop table Books;
drop table Author;
drop table Borrower;

