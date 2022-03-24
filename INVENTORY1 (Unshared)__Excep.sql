
DECLARE
tot_count NUMBER(10);
BEGIN
sales_procedure(0,tot_count);
dbms_output.put_line(tot_count);
END;


create or replace NONEDITIONABLE PROCEDURE Sales_Procedure(s_order_id IN NUMBER,tcount OUT NUMBER)
AS 
ordid sales.order_id%type;
sales_dt sales.sales_date%type;
user_excep Exception;
BEGIN
IF s_order_id <=0 then 
RAISE user_excep;
END IF;
select order_id,sales_date into ordid,sales_dt from sales where order_id=s_order_id;

dbms_output.put_line(ordid);
dbms_output.put_line(sales_dt);
select REC_COUNT(1270,sales_dt) into tcount from dual;
dbms_output.put_line(tcount);
select count(1) into tcount from sales where sales_date=sales_dt;

EXCEPTION
WHEN user_excep then
dbms_output.put_line('User defined exception');
/*WHEN no_data_found then
dbms_output.put_line('No data found');
*/WHEN others then
dbms_output.put_line('Others');
END;