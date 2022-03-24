create or replace NONEDITIONABLE Package Exercise_5 AS 
PROCEDURE Sales_Procedure(s_order_id IN NUMBER,tcount OUT NUMBER);
PROCEDURE FETCH_SALES (S_ORDERID IN NUMBER);
Function rec_count(n1 IN Number,n2 IN date) Return Number;
Function ret_of_pow(n1 IN Number,n2 IN Number) Return Number;
END Exercise_5;

create or replace NONEDITIONABLE Package BODY Exercise_5 AS 
PROCEDURE Sales_Procedure(s_order_id IN NUMBER,tcount OUT NUMBER)
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
END Sales_Procedure;
PROCEDURE FETCH_SALES (S_ORDERID IN NUMBER)
AS
L_DATE SALES.SALES_DATE%TYPE;
L_ORDERID SALES.ORDER_ID%TYPE;
L_TOTALROWS SALES.ORDER_ID%TYPE;
L_PRODUCTID SALES.PRODUCT_ID%TYPE;
L_CUSTOMERID SALES.CUSTOMER_ID%TYPE;
L_SALESPERSONID SALES.SALESPERSON_ID%TYPE;
L_QUANTITY SALES.QUANTITY%TYPE;
L_UNITPRICE SALES.UNIT_PRICE%TYPE;
L_SALESAMOUNT SALES.SALES_AMOUNT%TYPE;
L_TAXAMOUNT SALES.TAX_AMOUNT%TYPE;
L_TOTALAMOUNT SALES.TOTAL_AMOUNT%TYPE;
BEGIN
SELECT SALES_DATE, ORDER_ID, PRODUCT_ID, CUSTOMER_ID, SALESPERSON_ID, QUANTITY,
UNIT_PRICE, SALES_AMOUNT, TAX_AMOUNT, TOTAL_AMOUNT
INTO
L_DATE, L_ORDERID, L_PRODUCTID, L_CUSTOMERID, L_SALESPERSONID, L_QUANTITY, L_UNITPRICE,
L_SALESAMOUNT, L_TAXAMOUNT, L_TOTALAMOUNT
FROM SALES
WHERE ORDER_ID = S_ORDERID;
DBMS_OUTPUT.PUT_LINE (L_DATE);
DBMS_OUTPUT.PUT_LINE (L_ORDERID);
DBMS_OUTPUT.PUT_LINE (L_PRODUCTID);
DBMS_OUTPUT.PUT_LINE (L_CUSTOMERID);
DBMS_OUTPUT.PUT_LINE (L_SALESPERSONID);
DBMS_OUTPUT.PUT_LINE (L_QUANTITY);
DBMS_OUTPUT.PUT_LINE (L_UNITPRICE);
DBMS_OUTPUT.PUT_LINE (L_SALESAMOUNT);
DBMS_OUTPUT.PUT_LINE (L_TAXAMOUNT);
DBMS_OUTPUT.PUT_LINE (L_TOTALAMOUNT);
SELECT COUNT(1) INTO L_TOTALROWS FROM SALES
WHERE SALES_DATE = L_DATE;
dbms_output.put_line(L_TOTALROWS);
END FETCH_SALES;
 Function rec_count(n1 IN Number,n2 IN date) Return Number
AS
    num Number(10);
    BEGIN
       select count(1)into num from sales where sales_date=n2;
        return num;
        END rec_count;
Function ret_of_pow(n1 IN Number,n2 IN Number) Return Number
AS
    cntr Number(10):=1;
    num Number(10):=1;
    BEGIN
        FOR CNTR In 1..n2
        LOOP
        num:=num*n1;
        END LOOP;
        return num;
        END ret_of_pow;
END Exercise_5;

execute exercise_5.fetch_sales(1269);