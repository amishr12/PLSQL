/*DECLARE
TYPE customer_type IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
customer_table customer_type;
v_idx Number(10);
BEGIN 
customer_table(1):='TOM';
customer_table(2):='CAT';
customer_table(3):='RAT';
customer_table(4):='DOG';
customer_table(5):='BAT';
customer_table(6):='MAN';
customer_table(7):='ABHI';
customer_table(8):='GOAT';
customer_table(9):='MAD';
customer_table(10):='BAD';

customer_table.Delete(3);
customer_table.Delete(7);

v_idx:=customer_table.FIRST;

WHILE v_idx IS NOT NULL LOOP
dbms_output.put_line(customer_table(v_idx));
v_idx:=customer_table.NEXT(v_idx);
END LOOP;
END;


DECLARE
TYPE customer_type IS TABLE OF VARCHAR2(100);
customer_table customer_type:=customer_type();
v_idx Number(10);
BEGIN
customer_table.EXTEND(10);
customer_table(1):='TOM';
customer_table(2):='CAT';
customer_table(3):='RAT';
customer_table(4):='DOG';
customer_table(5):='BAT';
customer_table(6):='MAN';
customer_table(7):='ABHI';
customer_table(8):='GOAT';
customer_table(9):='MAD';
customer_table(10):='BAD';

customer_table.Delete(3);
customer_table.Delete(7);

v_idx:=customer_table.FIRST;

WHILE v_idx IS NOT NULL LOOP
dbms_output.put_line(customer_table(v_idx));
v_idx:=customer_table.NEXT(v_idx);
END LOOP;
END;
*/

DECLARE
TYPE customer_type IS VARRAY(10) OF VARCHAR2(100);
customer_table customer_type:=customer_type();
v_idx Number;
BEGIN
customer_table.EXTEND(10);
customer_table(1):='TOM';
customer_table(2):='CAT';
customer_table(3):='RAT';
customer_table(4):='DOG';
customer_table(5):='BAT';
customer_table(6):='MAN';
customer_table(7):='ABHI';
customer_table(8):='GOAT';
customer_table(9):='MAD';
customer_table(10):='BAD';

--customer_table.Delete(3);
--customer_table.Delete(7);

v_idx:=customer_table.FIRST;

WHILE v_idx IS NOT NULL LOOP
dbms_output.put_line(customer_table(v_idx));
v_idx:=customer_table.NEXT(v_idx);
END LOOP;
END;