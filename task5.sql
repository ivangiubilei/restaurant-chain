-- Application context:
-- emp_id, emp_role, chain_name, restaurant_id

CREATE CONTEXT emp_ctx USING set_emp_ctx_pkg;
SELECT * FROM sys.dba_context;

CREATE OR REPLACE EDITIONABLE PACKAGE "ADMIN"."SET_EMP_CTX_PKG" IS
PROCEDURE set_emp; 
END; 
/
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
restaurant_id EMPLOYED.restaurant_id% TYPE;
BEGIN
    username := SYS_CONTEXT('USERENV', 'SESSION_USER');
    SELECT ed.employee_id, ed.employee_role, ed.chain_name, ed.restaurant_id INTO emp_id, emp_role, chain_name, restaurant_id
    FROM ADMIN.EMPLOYED ed JOIN ADMIN.EMPLOYEE e ON ed.EMPLOYEE_ID = e.EMPLOYEE_ID
    WHERE REPLACE(UPPER(SUBSTR(e.email, 1, INSTR(e.email, '@')-1)),'.','_') = username;
    
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'emp_id', emp_id); 
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'emp_role', emp_role);
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'chain_name', chain_name);
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'restaurant_id', restaurant_id);

    EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;  
END;
END;


CREATE OR REPLACE TRIGGER set_staff_ctx_trig
    AFTER LOGON
    ON DATABASE
BEGIN
    set_emp_ctx_pkg.set_emp;
EXCEPTION
    WHEN OTHERS THEN dbms_output.put_line('EXCEPTION_OTHERS');
END;

---------------------
-- offers by employees --

CREATEB VIEW OFFERS_AGGREGATED as
SELECT offers."OFFERS_ID", offers."RESTAURANT_ID", offers."STARTING_DATE", offers."POINTS", offers."DESCRIPTION", offers."ENDING_DATE", RESTAURANT.CHAIN_NAME 
FROM OFFERS JOIN RESTAURANT ON OFFERS.RESTAURANT_ID = RESTAURANT.RESTAURANT_ID

SELECT offers."OFFERS_ID",offers."RESTAURANT_ID",offers."STARTING_DATE",offers."POINTS",offers."DESCRIPTION",offers."ENDING_DATE", RESTAURANT.CHAIN_NAME 
    FROM OFFERS JOIN RESTAURANT ON OFFERS.RESTAURANT_ID = RESTAURANT.RESTAURANT_ID

create or replace FUNCTION ADMIN.view_offers_function_employee(
    schema_var VARCHAR2,
    table_var VARCHAR2)
    RETURN VARCHAR2
    IS
    return_val VARCHAR2(400);
    employee_role EMPLOYED.employee_role% TYPE;
    chain_name EMPLOYED.CHAIN_NAME%TYPE;
    restaurant_id EMPLOYED.restaurant_id% TYPE;
BEGIN
    employee_role := SYS_CONTEXT('emp_ctx', 'emp_role');
    chain_name := SYS_CONTEXT('emp_ctx', 'chain_name');
    restaurant_id := SYS_CONTEXT('emp_ctx', 'restaurant_id');
    IF employee_role = 'CEO' THEN
        return_val := 'chain_name = ''' || chain_name || '''';
    ELSE 
        IF employee_role = 'director' THEN
            return_val := 'restaurant_id = ' || restaurant_id;
        ELSE
            return_val := '0=1';
        END IF;
    END IF;
    RETURN return_val;
END view_offers_function_employee;

BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'OFFERS_AGGREGATED',
            POLICY_NAME => 'VIEW_OFFERS_EMPLOYEES',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'view_offers_function_employee'
        );
END;


---------------------
-- Employed counts--

create view EMPLOYED_NUMBER as
select count(employee_id) as employed_number, chain_name, restaurant_id 
from employed 
where TO_DATE<=all(select current_date from dual) 
group by chain_name, restaurant_id

CREATE OR REPLACE FUNCTION count_employed(
    schema_var VARCHAR2,
    table_var VARCHAR2)
    RETURN VARCHAR2
    IS
    return_val VARCHAR2(400);
    employee_role EMPLOYED.employee_role% TYPE;
    chain_name EMPLOYED.CHAIN_NAME%TYPE;
    restaurant_id EMPLOYED.restaurant_id% TYPE;
BEGIN
    employee_role := SYS_CONTEXT('emp_ctx', 'emp_role');
    chain_name := SYS_CONTEXT('emp_ctx', 'chain_name');
    restaurant_id := SYS_CONTEXT('emp_ctx', 'restaurant_id');
    IF employee_role = 'CEO' THEN
        return_val := 'chain_name = ''' || chain_name || '''';
    ELSE 
        IF employee_role = 'director' THEN
            return_val := 'restaurant_id = ' || restaurant_id;
        ELSE
            return_val := '0=1';
        END IF;
    END IF;
    RETURN return_val;
END count_employed;

BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'employed_number',
            POLICY_NAME => 'count_employed',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'count_employed'
        );
END;

------------------------
-- Hide Employement ID--
    
CREATE OR REPLACE FUNCTION hide_id_employement(
    schema_var VARCHAR2,
    table_var VARCHAR2)
    RETURN VARCHAR2
    IS
    return_val VARCHAR2(400);
    employee_role EMPLOYED.employee_role% TYPE;
    chain_name EMPLOYED.CHAIN_NAME%TYPE;
BEGIN
    employee_role := SYS_CONTEXT('emp_ctx', 'emp_role');
    chain_name := SYS_CONTEXT('emp_ctx', 'chain_name');
    IF employee_role = 'CEO' THEN
        return_val := 'chain_name = ''' || chain_name || '''';
    ELSE
        return_val := 'employement_id = NULL';
    END IF;
    RETURN return_val;
END hide_id_employement;


BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'EMPLOYED',
            POLICY_NAME => 'VPD_hide_employement_id',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'hide_id_employement',
            SEC_RELEVANT_COLS => 'employement_id',
            SEC_RELEVANT_COLS_OPT => dbms_rls.ALL_ROWS
        );
END;

------------------------
-- Supplier ID privacy--

CREATE OR REPLACE FUNCTION hide_id_supplier(
    schema_var VARCHAR2,
    table_var VARCHAR2)
    RETURN VARCHAR2
    IS
    return_val VARCHAR2(400);
    employee_role EMPLOYED.employee_role% TYPE;
    restaurant_id   EMPLOYED.restaurant_id% TYPE;

BEGIN
    employee_role := SYS_CONTEXT('emp_ctx', 'emp_role');
    IF employee_role = 'CEO' THEN
        return_val := '1=1';
    ELSE
        restaurant_id := SYS_CONTEXT('emp_ctx', 'restaurant_id');
        return_val := 'supplier_id = NULL' and 'restaurant_id =' || restaurant_id ;
    END IF;
    RETURN return_val;
END hide_id_supplier;
/

BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'SHIPMENT',
            POLICY_NAME => 'VPD_hide_supplier_id',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'hide_id_supplier',
            SEC_RELEVANT_COLS => 'supplier_id',
            SEC_RELEVANT_COLS_OPT => dbms_rls.ALL_ROWS
        );
END;
/

---------------------
-- Points privacy----

CREATE CONTEXT point_ctx USING set_point_ctx_pkg;
SELECT * FROM sys.dba_context;

CREATE OR REPLACE EDITIONABLE PACKAGE "ADMIN"."SET_POINT_CTX_PKG" IS
PROCEDURE set_point;
END;


CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ADMIN"."SET_POINT_CTX_PKG" IS
PROCEDURE set_point
IS 
username varchar2(200);
id_client CLIENT.Client_id% TYPE;
BEGIN
    username:= SYS_CONTEXT('USERENV', 'SESSION_USER');
    SELECT c.CLIENT_ID INTO id_client
    FROM ADMIN.CLIENT c
    WHERE REPLACE(UPPER(SUBSTR(c.email, 1, INSTR(c.email, '@')-1)),'.','_') = username;
    
    DBMS_SESSION.SET_CONTEXT('point_ctx', 'id_client', id_client); 

    EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;  
END;
END;

CREATE OR REPLACE TRIGGER set_points_ctx_trig
    AFTER LOGON
    ON DATABASE
BEGIN
    set_point_ctx_pkg.set_point;
EXCEPTION
    WHEN OTHERS THEN dbms_output.put_line('EXCEPTION_OTHERS');
END;


CREATE OR REPLACE FUNCTION select_account_function(
    schema_var VARCHAR2,
    table_var VARCHAR2)
    RETURN VARCHAR2
    IS
    return_val VARCHAR2(400);
    id_client CLIENT.CLIENT_ID%TYPE;
BEGIN
    id_client := SYS_CONTEXT('point_ctx', 'id_client');
    RETURN 'client_id = ' || id_client;
END select_account_function;


BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'ACCOUNT',
            POLICY_NAME => 'select_account_policy',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'select_account_function'
        );
END;


-----------------------
-- Grant to the users--
grant select on account to alice_rossi;
grant select on offers_aggregated to John_Smith;
grant select on shipment to John_Smith;
grant select on employed_number to John_Smith;
grant select on employed to John_Smith;
grant select on offers_aggregated to Olivia_Evans;
grant select on shipment to Olivia_Evans;
grant select on employed_number to Olivia_Evans;
grant select on employed to Olivia_Evans;
