/*create or replace procedure process_cust(cust_id IN sales.customer_id%type)
AS
ord_id sales.order_id%type;
prod_id sales.product_id%type;
 cursor c is select order_id,product_id from sales where customer_id=cust_id;
 
 BEGIN
 open c;
 fetch c into ord_id,prod_id;
 dbms_output.put_line(ord_id);
 dbms_output.put_line(prod_id); 
 open c;
 close c;
 EXCEPTION
 WHEN CURSOR_ALREADY_OPEN THEN
 dbms_output.Put_line('cursor already open');
 END;



create or replace procedure process_cust_FOR(cust_id IN sales.customer_id%type)
AS
/*ord_id sales.order_id%type;
prod_id sales.product_id%type;
BEGIN
FOR c_rec in (select order_id,product_id from sales where customer_id=cust_id)
LOOP
 dbms_output.put_line(c_rec.product_id); 
 dbms_output.put_line(c_rec.order_id); 
 END LOOP;
 END;
*/

Create or replace function get_details(cust_id sales.customer_id%type)
RETURN SYS_REFCURSOR
IS
l_return SYS_REFCURSOR;
BEGIN
open l_return FOR
select product_id,order_id from sales where customer_id=cust_id;
RETURN l_return;
END get_details;

Create or Replace procedure display_details
IS
C_REC SYS_REFCURSOR;
PROD_ID NUMBER(20);
ORD_ID NUMBER(20);
BEGIN
C_rec:=get_details(12);
LOOP
FETCH C_REC into ORD_ID,PROD_ID;
EXIT WHEN C_REC%NOTFOUND;
dbms_output.put_line(PROD_ID); 
 dbms_output.put_line(ORD_ID); 
END LOOP;
CLOSE C_REC;
END;

--execute process_cust_FOR(10);
execute display_details;













select * from sales;