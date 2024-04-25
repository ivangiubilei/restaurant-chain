-- information to be granted to a CEO of the arigatto chain

CREATE VIEW arigatto_restaurants AS
SELECT r.*, s.SHIPMENT_ID, s.supplier_id, s.PRODUCT_NAME, s.AMOUNT, s.PRODUCT_TYPE
from RESTAURANT r, SHIPMENT s
where r.chain_name = 'AriGatto' and s.RESTAURANT_ID = 2;

GRANT SELECT, INSERT, UPDATE, DELETE ON arigatto_restaurants TO John_Smith WITH GRANT OPTION;

-- information to be granted to a CEO of the arigatto chain

CREATE VIEW arigatto_employee AS
SELECT *
from Employed e
where CHAIN_NAME = 'AriGatto';

GRANT SELECT, INSERT, UPDATE, DELETE ON arigatto_employee TO John_Smith  WITH GRANT OPTION;

-- information to be granted to a CEO of the arigatto chain offers
CREATE VIEW offers_arigatto AS
SELECT *
FROM offers
WHERE restaurant_id IN (
        SELECT restaurant_id
        FROM restaurant
        WHERE restaurant.chain_name = 'AriGatto');

GRANT SELECT, INSERT, UPDATE, DELETE ON offers_arigatto TO John_Smith WITH GRANT OPTION;

-- information to be granted to a director of the first restaurant (chef can see only the shipment view)

CREATE VIEW shipment_restaurant_1 AS
SELECT *
from SHIPMENT
where restaurant_id = 2;

CREATE VIEW employed_restaurant_1 AS
SELECT e.*
from EMPLOYED e
where restaurant_id = 2;

GRANT SELECT, INSERT, UPDATE, DELETE ON shipment_restaurant_1 TO Sarah_Jones; -—(director)
GRANT SELECT, INSERT, UPDATE, DELETE ON employed_restaurant_1 TO Sarah_Jones;
  
GRANT SELECT ON shipment_restaurant_1 TO Christopher_Clark; -—(chef only the shipment view)

-- information to be granted to the director of a restaurant on the offers

CREATE VIEW offers_restaurant_1 AS
SELECT * 
FROM OFFERS
WHERE RESTAURANT_ID = 2;

GRANT SELECT, INSERT, UPDATE, DELETE ON offers_restaurant_1 TO Sarah_Jones;

-- information to be granted to the director on the account of the first restaurant 

CREATE VIEW account_restaurant_1 AS
SELECT *
FROM Account
WHERE RESTAURANT_ID = 2;

GRANT SELECT, INSERT, UPDATE, DELETE ON account_restaurant_1 TO Sarah_Jones;

-- information to be granted to a maitre of the first restaurant

CREATE VIEW maitre_information_1 AS
SELECT *
FROM EMPLOYED
WHERE RESTAURANT_ID = 1 AND (EMPLOYEE_ROLE = 'waiter' or EMPLOYEE_ROLE = 'barman' or EMPLOYEE_ROLE = 'cleaner');

GRANT SELECT, INSERT, UPDATE, DELETE ON maitre_information_1 TO Liam_Turner;

-- information to be granted to the barman on the shipment which product type is the 'beverage'

CREATE VIEW drink_shipment_1 AS
SELECT *
FROM SHIPMENT
WHERE (product_type = 'Beverages') AND (RESTAURANT_ID = 1);

GRANT SELECT ON drink_shipment_1 TO Noah_Jackson;

-- information to be granted to a cleaner of the first restaurant

CREATE VIEW address_restaurant_1 AS
SELECT address, phone_number
FROM Restaurant
WHERE restaurant_id = 1;

GRANT SELECT ON address_restaurant_1 TO Charlotte_Davies;

-- information to be granted to a supplier of its shipment

CREATE VIEW shipment_supplier_1 AS
SELECT s.*
FROM Shipment s
WHERE s.supplier_id = 1;

GRANT SELECT, INSERT, UPDATE, DELETE ON shipment_supplier_1 TO supplier_1;

-- information to be granted of the different accounts based on the points, three different type of offers: basic, pro, VIP

CREATE VIEW offers_curr_bas_1 AS SELECT offers.*, trunc(current_date) AS current_date 
FROM offers, dual  
WHERE starting_date < current_date AND ending_date > current_date AND restaurant_id = 1 AND points>=30 AND points<50;

GRANT SELECT ON offers_curr_bas_1 TO account1;

CREATE VIEW offers_curr_pro_1 AS SELECT offers.*, trunc(current_date) AS current_date 
FROM offers, dual
WHERE starting_date < current_date AND ending_date > current_date AND restaurant_id = 1 AND points>=50 AND points<70;

GRANT SELECT ON offers_curr_pro_1 TO account1;

CREATE VIEW offers_curr_vip_1 AS SELECT offers.*, trunc(current_date) AS current_date 
FROM offers, dual  
WHERE starting_date < current_date AND ending_date > current_date AND restaurant_id = 1 AND points>=70;

GRANT SELECT ON offers_curr_vip_1 TO account1;
        
-- information to be granted on the available offers to a specific restaurant
CREATE VIEW offers_restaurant_1 AS
SELECT * 
FROM OFFERS
WHERE RESTAURANT_ID = 1;

GRANT SELECT, INSERT, UPDATE, DELETE ON offers_restaurant_1 TO Sarah_Jones;

-- information to be granted on the available offers to a specific restaurant chain
CREATE VIEW offers_arigatto AS
SELECT *
FROM offers
WHERE restaurant_id IN (
        SELECT restaurant_id
        FROM restaurant
        WHERE restaurant.chain_name = 'AriGatto');
        
GRANT SELECT, INSERT, UPDATE, DELETE ON offers_arigatto TO John_Smith WITH GRANT OPTION;

