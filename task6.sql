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
label_value     => 'U::',
data_label      => TRUE);
END;


