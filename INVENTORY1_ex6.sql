Create or replace procedure sales_rec(ord_id IN sales.order_id%type,opt OUT sales%rowtype)
AS
c_rec sales%rowtype;
BEGIN
select * into c_rec from sales where order_id=ord_id;
dbms_output.put_line(c_rec.product_id);
opt:=c_rec;
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('No Data Found Exception');
WHEN OTHERS THEN
dbms_output.put_line('Other Exception');
END;

Create or Replace procedure display_rec(ord_id IN sales.order_id%type)
AS
c_rec sales%rowtype;

begin
sales_rec(ord_id,c_rec); 
dbms_output.put_line(c_rec.product_id);
dbms_output.put_line(c_rec.SALES_DATE);
dbms_output.put_line(c_rec.order_id);
dbms_output.put_line(c_rec.salesperson_id);
dbms_output.put_line(c_rec.quantity);
dbms_output.put_line(c_rec.unit_price);
dbms_output.put_line(c_rec.sales_amount);
dbms_output.put_line(c_rec.tax_amount);
dbms_output.put_line(c_rec.total_amount);
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('2 No Data Found Exception');
WHEN OTHERS THEN
dbms_output.put_line('2 Other Exception');
END;

exec display_rec(1269);
