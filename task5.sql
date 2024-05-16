CREATE CONTEXT emp_ctx USING set_emp_ctx_pkg;
SELECT * FROM sys.dba_context;

CREATE OR REPLACE EDITIONABLE PACKAGE "ADMIN"."SET_EMP_CTX_PKG" IS
PROCEDURE set_emp; 
END; 
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ADMIN"."SET_EMP_CTX_PKG" IS
PROCEDURE set_emp
IS 
username varchar2(200);
emp_id EMPLOYED.employee_id% TYPE;
emp_role EMPLOYED.employee_role% TYPE;
chain_name EMPLOYED.chain_name% TYPE;
BEGIN
    username:= SYS_CONTEXT('USERENV', 'SESSION_USER');
    SELECT ed.employee_id, ed.employee_role, ed.chain_name INTO emp_id, emp_role, chain_name
    FROM ADMIN.EMPLOYED ed JOIN ADMIN.EMPLOYEE e ON ed.EMPLOYEE_ID = e.EMPLOYEE_ID
    WHERE REPLACE(UPPER(SUBSTR(e.email, 1, INSTR(e.email, '@')-1)),'.','_') = username;
    
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'emp_id', emp_id); 
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'emp_role', emp_role);
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'chain_name', chain_name);

    EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;  
END;
END; 
