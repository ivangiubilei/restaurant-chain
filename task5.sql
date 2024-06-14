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
-- Employed counts--

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

--------------
-- Shipment --

CREATE OR REPLACE FUNCTION shipment_privacy(
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
        restaurant_id := SYS_CONTEXT('shipment_ctx', 'restaurant_id');
        return_val := 'active=1 AND restaurant_id =' || restaurant_id;
    END IF;
    RETURN return_val;
END shipment_privacy;
/

BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'SHIPMENT',
            POLICY_NAME => 'VPD_shipment_privacy',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'shipment_privacy'
        );
END;
/

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
-- Offers privacy----

CREATE OR REPLACE FUNCTION offers_privacy(
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
        return_val := 'active=1 AND restaurant_id=' || restaurant_id;
    END IF;
    RETURN return_val;
END offers_privacy;
/

BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'OFFERS',
            POLICY_NAME => 'VPD_offers_privacy',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'offers_privacy'
        );
END;
/

----------------------
-- Offers ID privacy--

CREATE OR REPLACE FUNCTION hide_id_offers(
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
        IF
            employee_role = 'Director' THEN
            restaurant_id := SYS_CONTEXT('emp_ctx', 'restaurant_id');
            return_val := 'offers_id = NULL and restaurant_id=' || restaurant_id;
        ELSE
            return_val := '0=1';
        END IF;
    END IF;
    RETURN return_val;
END hide_id_offers;
/

BEGIN
    SYS.DBMS_RLS.ADD_POLICY
        (
            OBJECT_SCHEMA => 'ADMIN',
            OBJECT_NAME => 'OFFERS',
            POLICY_NAME => 'VPD_hide_offers_id',
            FUNCTION_SCHEMA => 'ADMIN',
            POLICY_FUNCTION => 'hide_id_offers',
            SEC_RELEVANT_COLS => 'offers_id',
            SEC_RELEVANT_COLS_OPT => dbms_rls.ALL_ROWS
        );
END;
/

-----------------------
-- Grant to the users--
grant select on offers to John_Smith;
grant select on shipment to John_Smith;
grant select on employed to John_Smith;
grant select on offers to Olivia_Evans;
grant select on shipment to Olivia_Evans;
grant select on employed to Olivia_Evans;
