/*
--q1
DECLARE
nbr NUMBER(8,2):=10.11;
vrchr VARCHAR2(30):='Sample';
--dt DATE := trunc(SYSDATE);
dt1 DATE:=TO_DATE('27-OCT-20','dd-mon-yy');
BEGIN
DBMS_OUTPUT.PUT_LINE(nbr);
DBMS_OUTPUT.PUT_LINE(vrchr);
--DBMS_OUTPUT.PUT_LINE(dt);
DBMS_OUTPUT.PUT_LINE(dt1);
END;


--q2

DECLARE
salary NUMBER(20,2):=70000;

BEGIN
IF salary >100000
then
dbms_output.put_line('GRADE A');
elsIf salary >50000 and salary < 100000 then
dbms_output.put_line('GRADE B');
elsIf salary >25000 and salary < 50000 then
dbms_output.put_line('GRADE C');
elsIf salary >10000 and salary < 25000 then
dbms_output.put_line('GRADE D');
else
dbms_output.put_line('GRADE E');
END IF;
END;



--q3

DECLARE
salary NUMBER(20,2):=1000;

BEGIN
CASE
WHEN salary >100000
then
dbms_output.put_line('GRADE A');
WHEN salary >50000 and salary < 100000 then
dbms_output.put_line('GRADE B');
WHEN salary >25000 and salary < 50000 then
dbms_output.put_line('GRADE C');
WHEN salary >10000 and salary < 25000 then
dbms_output.put_line('GRADE D');
else
dbms_output.put_line('GRADE E');
END CASE;
END;



--q4

DECLARE
cntr NUMBER:=200;
BEGIN
WHILE cntr <301
LOOP
dbms_output.put_line(cntr);
cntr:=cntr+1;
END LOOP;
END;

--q5

DECLARE
cntr NUMBER:=200;
BEGIN
FOR cntr IN 200..300
LOOP
dbms_output.put_line(cntr);

END LOOP;
END;
    


--q6
DECLARE
cntr number:=3;



BEGIN
IF cntr=1 then
DECLARE
cntr NUMBER:=300;
BEGIN
WHILE cntr <401
LOOP
dbms_output.put_line(cntr);
cntr:=cntr+1;
END LOOP;
END;

ELSIF cntr=2 then
DECLARE
cntr NUMBER:=200;
BEGIN
FOR cntr IN 200..300
LOOP
dbms_output.put_line(cntr);

END LOOP;
END;
ELSIF cntr=3 then
dbms_output.put_line('wrong choice');
END IF;
END;

*/