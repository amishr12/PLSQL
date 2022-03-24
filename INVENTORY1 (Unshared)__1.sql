CREATE OR REPLACE PROCEDURE Sales_Procedure(s_order_id IN NUMBER,tcount OUT NUMBER)
AS 
ordid sales.order_id%type;
sales_dt sales.sales_date%type;
BEGIN
select order_id,sales_date into ordid,sales_dt from sales where order_id=s_order_id;

dbms_output.put_line(ordid);
dbms_output.put_line(sales_dt);

select count(1) into tcount from sales where sales_date=sales_dt;
END;

DECLARE
tot_count NUMBER(10);
BEGIN
Sales_Procedure(1269,tot_count);
dbms_output.put_line(tot_count);
END;

DECLARE
TOTAL_ROWS NUMBER;
BEGIN
FETCH_SALES (1269, TOTAL_ROWS);
DBMS_OUTPUT.PUT_LINE ('Total Number of rows: ' || TOTAL_ROWS);
END;

CREATE OR REPLACE PROCEDURE FETCH_SALES (S_ORDERID IN NUMBER, L_TOTALROWS OUT
NUMBER)
AS
L_DATE SALES.SALES_DATE%TYPE;
L_ORDERID SALES.ORDER_ID%TYPE;
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
END;

Create or replace Function rec_count(n1 IN Number,n2 IN date) 
Return Number
AS
    num Number(10);
    BEGIN
       select count(1)into num from sales where sales_date=n2;
        return num;
        END;

Create or replace Function ret_of_pow(n1 IN Number,n2 IN Number) Return Number
AS
    cntr Number(10):=1;
    num Number(10):=1;
    BEGIN
        FOR CNTR In 1..n2
        LOOP
        num:=num*n1;
        END LOOP;
        return num;
        END;
 select ret_of_pow(10,2) from dual;       
 
 select ret_of_pow(10,2) from dual;   
 select * from sales;
 select rec_count(1270,(to_date('09-02-15','dd-mm-yy'))) from dual;
dbms_output.put_line(tcount);