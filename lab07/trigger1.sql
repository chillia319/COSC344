SET SERVEROUTPUT ON;
CREATE OR REPLACE 
PROCEDURE listDependent 
AS 
    CURSOR dc IS SELECT * FROM dependent;
    n dc%ROWTYPE;
BEGIN
    FOR n in dc LOOP
        DBMS_OUTPUT.put_line(n.dependent_name ||' '||n.relationship);
    END LOOP;
END;
/
