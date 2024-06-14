BEGIN
SA_SYSDBA.CREATE_POLICY
(
policy_name => 'Proj_OLS_POL',
column_name => 'OLS_COL',
default_options => 'read_control');
END;

select * from ALL_SA_POLICIES;

EXEC SA_SYSDBA.ENABLE_POLICY ('Proj_OLS_POL');

-- granted DBA role to admin from dashboard

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
policy_name => 'Proj_OLS_POL',
level_num => 3000,
short_name => 'HS',
long_name => 'HIGHLY_SENSITIVE');
END;

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
Policy_name => 'Proj_OLS_POL',
level_num => 2000,
short_name => 'S',
long_name => 'SENSITIVE');
END;

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
Policy_name => 'Proj_OLS_POL',
level_num => 100,
short_name => 'U',
long_name => 'UNRESTRICTED');
END;

select * from dual;

