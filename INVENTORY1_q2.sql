select * from SALES;

DECLARE
ordid sales.order_id%type :=1269;
ordid1 sales.order_id%type :=1271;
qty sales.quantity%type;
BEGIN
select QUANTITY INTO qty from sales where order_id=ordid;
--INSERT into sales (order_id) values (ordid1);
update sales set quantity=qty where order_id=ordid1;
commit;
delete from sales where order_id=ordid1;

commit;
dbms_output.put_line(qty);
END;