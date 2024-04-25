----CEO ROLE----
--role definition
CREATE ROLE ceo_arigatto;

--view definition
CREATE OR REPLACE VIEW arigatto_restaurant AS
SELECT r.*, s.shipment_id, s.supplier_id, s.product_name, s.amount, s.product_type
FROM ADMIN.RESTAURANT r, ADMIN.SHIPMENT s
WHERE r.chain_name = 'AriGatto';

CREATE OR REPLACE VIEW ARIGATTO_EMPLOYEE AS
SELECT * 
FROM ADMIN.EMPLOYED
WHERE CHAIN_NAME = 'AriGatto';

CREATE OR REPLACE VIEW ARIGATTO_OFFERS AS
SELECT *
FROM ADMIN.OFFERS
WHERE restaurant_id IN (
        SELECT restaurant_id
        FROM ADMIN.RESTAURANT
        WHERE restaurant.chain_name = 'AriGatto');
        
-- grant operations
GRANT ALL PRIVILEGES ON ARIGATTO_EMPLOYEE to ceo_arigatto;
GRANT ALL PRIVILEGES ON arigatto_restaurant to ceo_arigatto;
GRANT ALL PRIVILEGES ON ARIGATTO_OFFERS to ceo_arigatto;

--grant the role to the CEO 
GRANT ceo_arigatto to John_Smith WITH ADMIN OPTION;

----DIRECTOR ROLE----
--role definition
CREATE ROLE director_arigatto_2;

-- view definition
CREATE OR REPLACE VIEW ARIGATTO_EMPLOYEE_2 AS
SELECT * 
FROM ADMIN.EMPLOYED
WHERE RESTAURANT_ID = 2;

CREATE OR REPLACE VIEW ARIGATTO_OFFERS_2 AS
SELECT * 
FROM ADMIN.OFFERS
WHERE RESTAURANT_ID = 2;

CREATE OR REPLACE VIEW ARIGATTO_CUSTOMERS_2 AS
SELECT a.restaurant_id, a.points, a.frequency, c.*
FROM ADMIN.CLIENT C JOIN ADMIN.ACCOUNT A ON C.CLIENT_ID = A.CLIENT_ID
WHERE A.RESTAURANT_ID = 2;

--grant operations
GRANT ALL PRIVILEGES on ARIGATTO_CUSTOMERS_2 to director_arigatto_2
GRANT ALL PRIVILEGES ON ARIGATTO_EMPLOYEE_2 to director_arigatto_2;
GRANT ALL PRIVILEGES ON ARIGATTO_OFFERS_2 to director_arigatto_2;

--grant operation to the director
GRANT Director_arigatto_2 to Olivia_Evans;

----CHEF ROLE----
--role definition
CREATE ROLE chef_arigatto_2;

--view definition
CREATE OR REPLACE VIEW Shipments_2 AS
SELECT * 
FROM ADMIN.SHIPMENT
WHERE restaurant_id = 2;

--grant operation
GRANT SELECT ON Shipments_2 TO chef_arigatto_2;

--grant operation to the chef
GRANT chef_arigatto_2 to christopher_clark;

----MAITRE ROLE----
--role definition
CREATE ROLE maitre_arigatto_2;

--view definition
CREATE OR REPLACE VIEW maitre_information_1 AS
SELECT *
FROM ADMIN.EMPLOYED
WHERE RESTAURANT_ID = 1 AND (EMPLOYEE_ROLE = 'waiter' or EMPLOYEE_ROLE = 'barman' or EMPLOYEE_ROLE = 'cleaner')

--grant operations
GRANT ALL PRIVILEGES ON arigatto_employee_2 TO maitre_arigatto_2;

--grant operation to the maitre
GRANT maitre_arigatto_2 to Isabella_Garcia;

----BARMAN ROLE----
--role definition
CREATE ROLE barman_arigatto_2;

--view definition
CREATE OR REPLACE VIEW Beverage_Shipments_2 AS
SELECT * 
FROM shipment
WHERE restaurant_id = 2 AND PRODUCT_TYPE='beverages';

--grant operation to barman
GRANT SELECT ON Shipments_2 TO barman_arigatto_2;

--grant role to the barman
GRANT barman_arigatto_2 to Sophia_Wilson;

----CLEANER ROLE----
--role definition
CREATE ROLE cleaner_arigatto_2;

--view definition
CREATE OR REPLACE VIEW arigatto_cleaner AS
SELECT phone_number, address 
FROM restaurant
WHERE restaurant_id = 2;

--grant operations
GRANT SELECT ON arigatto_cleaner TO cleaner_arigatto_2;

--grant operation to the cleaner
GRANT cleaner_arigatto_2 TO Noah_Perez;

----CUSTOMER ROLE----
--role definition
CREATE ROLE restaurant_2_customer_id_1;

--view definition
CREATE OR REPLACE VIEW arigatto_customer_2 AS
SELECT c.*, a.points
FROM client c JOIN account a ON c.CLIENT_ID=a.CLIENT_ID
WHERE a.RESTAURANT_ID=2 AND c.client_id=1;

CREATE OR REPLACE VIEW arigatto_offers_gold_2 AS
SELECT *
FROM offers
WHERE restaurant_id=2 && points < 30;

CREATE OR REPLACE VIEW arigatto_offers_diamond_2 AS
SELECT *
FROM offers
WHERE restaurant_id=2 && points < 70;

CREATE OR REPLACE VIEW arigatto_offers_platinum_2 AS
SELECT *
FROM offers
WHERE restaurant_id=2 && points < 100;

--grant operations
GRANT SELECT ON arigatto_customer_2 TO restaurant_2_customer_id_1;

--grant operation to the cleaner
GRANT restaurant_2_customer_id_1 TO Jane_Smith;
