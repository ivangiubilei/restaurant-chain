-- create ols environment
BEGIN
SA_SYSDBA.CREATE_POLICY
(
policy_name => 'Employee_OLS_POL',
column_name => 'LABEL_COL',
default_options => 'read_control');
END;

EXEC SA_SYSDBA.ENABLE_POLICY ('Employee_OLS_POL');

-- granted DBA role to admin from dashboard
-- create levels

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
policy_name => 'Employee_OLS_POL',
level_num => 3000,
short_name => 'HS',
long_name => 'HIGHLY_SENSITIVE');
END;

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
Policy_name => 'Employee_OLS_POL',
level_num => 2000,
short_name => 'S',
long_name => 'SENSITIVE');
END;

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
Policy_name => 'Employee_OLS_POL',
level_num => 100,
short_name => 'U',
long_name => 'UNRESTRICTED');
END;

-- create compartments

BEGIN
SA_COMPONENTS.CREATE_COMPARTMENT (
policy_name => 'Employee_OLS_POL',
short_name => 'PL',
long_name => 'Planeinos_Goodos',
comp_num         =>  1000);
END;

BEGIN
SA_COMPONENTS.CREATE_COMPARTMENT (
policy_name => 'Employee_OLS_POL',
short_name => 'AG',
long_name => 'AriGatto',
comp_num         =>  2000);
END;

BEGIN
SA_COMPONENTS.CREATE_COMPARTMENT (
policy_name => 'Employee_OLS_POL',
short_name => 'IT',
long_name => 'ItaloBros',
comp_num         =>  3000);
END;

-- create groups
BEGIN
SA_COMPONENTS.CREATE_GROUP (
policy_name => 'Employee_OLS_POL',
short_name => 'ad',
long_name => 'Administration',
group_num         =>  5000);
END;

BEGIN
SA_COMPONENTS.CREATE_GROUP (
policy_name => 'Employee_OLS_POL',
short_name => 'kt',
long_name => 'Kitchen',
group_num         =>  3000);
END;

BEGIN
SA_COMPONENTS.CREATE_GROUP (
policy_name => 'Employee_OLS_POL',
short_name => 'rr',
long_name => 'restaurant_room',
group_num         =>  1000);
END;

-- create labels
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1310',
label_value     => 'U::kt',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1410',
label_value     => 'U::ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1510',
label_value     => 'U::rr',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1620',
label_value     => 'S:IT:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1720',
label_value     => 'S:AG:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1820',
label_value     => 'S:PL:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1630',
label_value     => 'U:IT:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1730',
label_value     => 'U:AG:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1830',
label_value     => 'U:PL:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1640',
label_value     => 'HS:IT:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1740',
label_value     => 'HS:AG:ad',
data_label      => TRUE);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL  (
policy_name     => 'Employee_OLS_POL',
label_tag       => '1840',
label_value     => 'HS:PL:ad',
data_label      => TRUE);
END;

-- user labels
-- ceo
--- AUTHORIZING LEVELS
BEGIN
SA_USER_ADMIN.SET_LEVELS (
policy_name => 'Employee_OLS_POL',
user_name => 'John_Smith', --CEO
max_level => 'HS',
min_level => 'S',
def_level => 'HS',
row_level => 'HS');
END;

BEGIN
SA_USER_ADMIN.SET_LEVELS (
policy_name => 'Employee_OLS_POL',
user_name => 'Olivia_Evans', --Director
max_level => 'S',
min_level => 'U',
def_level => 'S',
row_level => 'S');
END;


--- AUTHORIZING COMPARTMENTS
BEGIN
SA_USER_ADMIN.SET_COMPARTMENTS (
policy_name => 'Employee_OLS_POL',
user_name => 'john_Smith',
read_comps => 'AG',
write_comps => 'AG',
def_comps => 'AG',
row_comps => 'AG');
END;

-- Policy 1 - EMPLOYED
alter table employed add LABEL_COL number(4);

update employed set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:AG:ad') where CHAIN_NAME = 'AriGatto';
update employed set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:PL:ad') where CHAIN_NAME = 'Planeinos Goodos';
update employed set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:IT:ad') where CHAIN_NAME = 'Italobros';

BEGIN SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
policy_name => 'Employee_OLS_POL',
schema_name => 'ADMIN',
table_name => 'EMPLOYED');
END;


-- Policy 2 - SUPPLIER

alter table supplier add LABEL_COL number(4);

update supplier set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','U::ad') where SUPPLY_TYPE = 'Cleaning Supplies';
update supplier set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','U::kt') where SUPPLY_TYPE in ('Produce', 'Meat', 'Seafood', 'Dairy');
update supplier set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','U::rr') where SUPPLY_TYPE in ('Wine', 'Beverages', 'Bakery', 'Coffee');

BEGIN SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
policy_name => 'Employee_OLS_POL',
schema_name => 'ADMIN',
table_name => 'SUPPLIER');
END;


-- policy 3 - OFFERS

alter table offers add LABEL_COL number(4);

update offers set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','U:AG:ad') where  RESTAURANT_ID in (select RESTAURANT_ID from RESTAURANT where chain_name = 'AriGatto');
update offers set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','U:PL:ad') where  RESTAURANT_ID in (select RESTAURANT_ID from RESTAURANT where chain_name = 'Planeinos Goodos');
update offers set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','U:IT:ad') where  RESTAURANT_ID in (select RESTAURANT_ID from RESTAURANT where chain_name = 'Italobros');

BEGIN SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
policy_name => 'Employee_OLS_POL',
schema_name => 'ADMIN',
table_name => 'OFFERS');
END;


-- policy 4 - ACCOUNT

alter table account add LABEL_COL number(4);

update account set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','HS:AG:ad') where  RESTAURANT_ID in (select RESTAURANT_ID from RESTAURANT where chain_name = 'AriGatto');
update account set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','HS:PL:ad') where  RESTAURANT_ID in (select RESTAURANT_ID from RESTAURANT where chain_name = 'Planeinos Goodos');
update account set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','HS:IT:ad') where  RESTAURANT_ID in (select RESTAURANT_ID from RESTAURANT where chain_name = 'Italobros');

BEGIN SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
policy_name => 'Employee_OLS_POL',
schema_name => 'ADMIN',
table_name => 'ACCOUNT');
END;


-- Policy 5 - SHIPMENT

alter table shipment add LABEL_COL number(4);

update shipment set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:AG:kt') where 
RESTAURANT_ID in (select RESTAURANT_ID 
from RESTAURANT 
where chain_name = 'AriGatto') and 
SUPPLIER_ID in (select shipment.SUPPLIER_ID 
from SUPPLIER where SUPPLY_TYPE in ('Produce', 'Meat', 'Seafood', 'Dairy'));

update shipment set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:PL:kt') where 
RESTAURANT_ID in (select RESTAURANT_ID 
from RESTAURANT 
where chain_name = 'Planeinos Goodos')and 
SUPPLIER_ID in (select shipment.SUPPLIER_ID 
from SUPPLIER where SUPPLY_TYPE in ('Produce', 'Meat', 'Seafood', 'Dairy'));

update shipment set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:IT:kt') where 
RESTAURANT_ID in (select RESTAURANT_ID 
from RESTAURANT 
where chain_name = 'Italobros')and 
SUPPLIER_ID in (select shipment.SUPPLIER_ID 
from SUPPLIER where SUPPLY_TYPE in ('Produce', 'Meat', 'Seafood', 'Dairy'));

update shipment set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:AG:rr') where 
RESTAURANT_ID in (select RESTAURANT_ID 
from RESTAURANT 
where chain_name = 'AriGatto')and 
SUPPLIER_ID in (select shipment.SUPPLIER_ID 
from SUPPLIER where SUPPLY_TYPE in ('Wine', 'Beverages', 'Bakery', 'Coffee'));

update shipment set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:PL:rr') where 
RESTAURANT_ID in (select RESTAURANT_ID 
from RESTAURANT 
where chain_name = 'Planeinos Goodos')and 
SUPPLIER_ID in (select shipment.SUPPLIER_ID 
from SUPPLIER where SUPPLY_TYPE in ('Wine', 'Beverages', 'Bakery', 'Coffee'));

update shipment set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','S:IT:rr') where 
RESTAURANT_ID in (select RESTAURANT_ID 
from RESTAURANT 
where chain_name = 'Italobros')and 
SUPPLIER_ID in (select shipment.SUPPLIER_ID 
from SUPPLIER where SUPPLY_TYPE in ('Wine', 'Beverages', 'Bakery', 'Coffee'));


BEGIN SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
policy_name => 'Employee_OLS_POL',
schema_name => 'ADMIN',
table_name => 'SHIPMENT');
END;


-- Policy 6 - EMPLOYED

alter table employee add LABEL_COL number(4);

update employee set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','HS:AG:ad') where  employee_id in (select employee_id from employed where chain_name = 'AriGatto');
update employee set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','HS:PL:ad') where  employee_id in (select employee_id from employed where chain_name = 'Planeinos Goodos');
update employee set LABEL_COL = CHAR_TO_LABEL('Employee_OLS_POL','HS:IT:ad') where  employee_id in (select employee_id from employed where chain_name = 'Italobros');

BEGIN SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
policy_name => 'Employee_OLS_POL',
schema_name => 'ADMIN',
table_name => 'EMPLOYEE');
END;
