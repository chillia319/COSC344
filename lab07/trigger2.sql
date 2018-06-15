SET SERVEROUTPUT ON;
drop procedure projectList;
CREATE OR REPLACE 
PROCEDURE projectList(x IN INT)
AS 
    CURSOR dc IS SELECT * FROM works_on WHERE pno = x;
    n dc%ROWTYPE;
    warning EXCEPTION;
BEGIN
    FOR n in dc LOOP
	BEGIN
	DBMS_OUTPUT.PUT_LINE(n.essn ||' '||n.hours);
        IF n.hours < 8.0 THEN
            RAISE warning;
	END IF;
        
	EXCEPTION
	WHEN warning THEN 
      	    DBMS_OUTPUT.PUT_LINE('NEED MORE HOURS :(');
        END;
    END LOOP;
END;
/
