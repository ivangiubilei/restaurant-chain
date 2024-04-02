-- Insert
-- Restaurants --
INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (1, 2483927114, 'Main Street 101', 'Italian, Seafood');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (2, 840072291, 'Elm Street 202', 'French, Asian');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (3, 2078943320, 'Park Avenue 303', 'American, Mexican');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (4, 9176619001, 'Beach Road 404', 'Mediterranean, Vegetarian');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (5, 1315634974, 'Hilltop Lane 505', 'Indian, Thai');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (6, 1234567890, 'Via Roma 1', 'Italian');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (7, 2345678901, 'Via Dante 2', 'Italian');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (8, 3456789012, 'Corso Vittorio Emanuele 3', 'Italian');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (9, 4567890123, 'Fast Food Street 10', 'Burgers, Fries');

INSERT INTO Restaurant (restaurant_id, phone_number, address, offers) 
VALUES (10, 5678901234, 'Quick Bite Alley 20', 'Sandwiches, Wraps');

-- Clients 
INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (1, 'David', 'Lee', 'david.lee@email.com', TO_DATE('1978-03-09', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (2, 'Emily', 'Wright', 'emily.wright@email.com', TO_DATE('1995-05-18', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (3, 'Charles', 'Robinson', 'charles.robinson@email.com', TO_DATE('1982-11-21', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (4, 'Angela', 'Lopez', 'angela.lopez@email.com', TO_DATE('2000-09-04', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (5, 'Matthew', 'Walker', 'matthew.walker@email.com', TO_DATE('1975-02-17', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (6, 'Susan', 'Hernandez', 'susan.hernandez@email.com', TO_DATE('1992-08-12', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (7, 'Daniel', 'Young', 'daniel.young@email.com', TO_DATE('1998-04-26', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (8, 'John', 'Doe', 'john.doe@email.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (9, 'Jane', 'Smith', 'jane.smith@email.com', TO_DATE('1985-07-14', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (10, 'Alice', 'Rossi', 'alice.johnson@email.com', TO_DATE('2002-12-25', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (11, 'Michael', 'Johnson', 'michael.johnson@email.com', TO_DATE('1989-07-15', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (12, 'Sophia', 'Garcia', 'sophia.garcia@email.com', TO_DATE('1975-04-28', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (13, 'Emma', 'Martinez', 'emma.martinez@email.com', TO_DATE('1993-10-12', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (14, 'Olivia', 'Esposito', 'olivia.smith@email.com', TO_DATE('1986-02-28', 'YYYY-MM-DD'), 'Secret_password11');

INSERT INTO Client (client_id, name, surname, email, birthday, password)
VALUES (15, 'Daniele', 'Verdi', 'daniel.taylor@email.com', TO_DATE('1990-09-15', 'YYYY-MM-DD'), 'Secret_password11');

-- Employees
INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (1, 1, 'Sarah', 'Jones', 'waiter', TO_DATE('1985-07-12', 'YYYY-MM-DD'), 'sarah.jones@email.com', TO_DATE('2022-06-15', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (2, 1, 'Michael', 'Chen', 'chef', TO_DATE('1978-03-21', 'YYYY-MM-DD'), 'michael.chen@email.com', TO_DATE('2018-05-09', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (3, 2, 'Isabella', 'Garcia', 'maitre', TO_DATE('1992-10-24', 'YYYY-MM-DD'), 'isabella.garcia@email.com', TO_DATE('2020-12-01', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (4, 2, 'David', 'Miller', 'sous-chef', TO_DATE('1982-01-10', 'YYYY-MM-DD'), 'david.miller@email.com', TO_DATE('2019-08-20', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (5, 3, 'Emily', 'Walker', 'waiter', TO_DATE('1995-05-18', 'YYYY-MM-DD'), 'emily.walker@email.com', TO_DATE('2023-01-16', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (6, 3, 'Noah', 'Jackson', 'cooks', TO_DATE('1997-02-06', 'YYYY-MM-DD'), 'noah.jackson@email.com', TO_DATE('2024-02-01', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (7, 4, 'Charlotte', 'Davies', 'director', TO_DATE('1968-08-15', 'YYYY-MM-DD'), 'charlotte.davies@email.com', TO_DATE('2010-01-04', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (8, 11, 'Daniel', 'Robinson', 'director', TO_DATE('1965-02-22', 'YYYY-MM-DD'), 'daniel.robinson@email.com', TO_DATE('2005-07-19', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (9, 5, 'Christopher', 'Clark', 'cleaner', TO_DATE('1988-06-09', 'YYYY-MM-DD'), 'christopher.clark@email.com', TO_DATE('2022-11-21', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (10, 13, 'Amelia', 'Moore', 'cooks', TO_DATE('2000-10-27', 'YYYY-MM-DD'), 'amelia.moore@email.com', TO_DATE('2023-09-05', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (11, 15, 'Sophia', 'Wilson', 'chef', TO_DATE('1985-04-10', 'YYYY-MM-DD'), 'sophia.wilson@email.com', TO_DATE('2010-09-15', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (12, 12, 'Ethan', 'Harris', 'waiter', TO_DATE('1994-12-28', 'YYYY-MM-DD'), 'ethan.harris@email.com', TO_DATE('2023-03-08', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (13, 14, 'Mia', 'Campbell', 'cleaner', TO_DATE('1982-07-17', 'YYYY-MM-DD'), 'mia.campbell@email.com', TO_DATE('2015-11-20', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (14, 9, 'James', 'Parker', 'sous-chef', TO_DATE('1978-03-25', 'YYYY-MM-DD'), 'james.parker@email.com', TO_DATE('2008-06-30', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (15, 10, 'Olivia', 'Evans', 'waiter', TO_DATE('1999-08-12', 'YYYY-MM-DD'), 'olivia.evans@email.com', TO_DATE('2024-01-10', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (16, 15, 'Liam', 'Turner', 'chef',  TO_DATE('1986-09-03', 'YYYY-MM-DD'), 'liam.turner@email.com', TO_DATE('2012-05-15', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (17, 13, 'Ava', 'Stewart', 'waiter', TO_DATE('1997-11-20', 'YYYY-MM-DD'), 'ava.stewart@email.com', TO_DATE('2023-07-18', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (18, 1, 'Noah', 'Perez', 'cleaner', TO_DATE('1980-05-14', 'YYYY-MM-DD'), 'noah.perez@email.com', TO_DATE('2017-09-22', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (19, 4, 'Emma', 'Sanchez', 'sous-chef', TO_DATE('1975-12-08', 'YYYY-MM-DD'), 'emma.sanchez@email.com', TO_DATE('2009-11-05', 'YYYY-MM-DD'));

INSERT INTO Employee (employee_id, restaurant_id, name, surname, rank, birthday, email, employment_date)
VALUES (20, 8, 'William', 'Gonzalez', 'waiter', TO_DATE('1990-02-17', 'YYYY-MM-DD'), 'william.gonzalez@email.com', TO_DATE('2022-04-30', 'YYYY-MM-DD'));

-- Suppliers
INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (1, 'Produce', 'Fresh Harvest Farms', 'John','Miller', 'miller@freshharvestfarms.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (2, 'Meat', 'Happy Valley Ranch', 'Jeremy', 'Johnson', 'johnson@happyvalleyranch.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (3, 'Seafood', 'Oceans Bounty', 'Manuel','Garcia', 'garcia@oceansbounty.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (4, 'Beverages', 'Sparkling Springs Water Co.', 'Jin', 'Li', 'li@sparklingsrings.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (5, 'Dairy', 'Green Pastures Creamery', 'Amanda', 'Jackson', 'jackson@greenpastures.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (6, 'Wine', 'Vines of Tuscany', 'Nicola', 'Rossi', 'rossi@vinesoftuscany.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (7, 'Bakery', 'Golden Crust Artisan Breads', 'Alfred', 'Nguyen', 'nguyen@goldencrustbreads.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (8, 'Coffee', 'Aroma del Mundo', 'Louis', 'Sanchez', 'sanchez@aromadelmundo.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (9, 'Seafood', 'Fresh Catch', 'Michael', 'Wang', 'wang@freashcatch.com');

INSERT INTO Supplier (supplier_id, supply_type, company, name, surname, email)
VALUES (10, 'Cleaning Supplies', 'EcoShine Products', 'Armando', 'Jones', 'jones@ecoshineproducts.com');

-- SHIPMENTS
INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type) 
VALUES(1, 2, 3, 'Shrimp', 50, 'Seafood');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (2, 3, 2, 'Ribeye Steak', 20, 'Meat');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (3, 4, 4, 'Sparkling Water', 120, 'Beverages');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (4, 5, 1, 'Lettuce', 75, 'Vegetables');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (5, 1, 3, 'Salmon', 30, 'Seafood');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (6, 2, 8, 'Coffee Capsules', 15, 'Coffee');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (7, 3, 4, 'Mineral Water', 80, 'Beverages');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (8, 4, 7, 'Onion Bread', 50, 'Bread');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (9, 5, 2, 'Ground Beef', 40, 'Meat');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (10, 1, 8, 'Coffe beans', 25, 'Coffee');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (11, 2, 10, 'Club Soda', 60, 'Cleaning Supplies');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (12, 3, 5, 'Onions', 40, 'Vegetables');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (13, 4, 10, 'Glass Cleaner', 15, '');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (14, 5, 9, 'Clams', 15, 'Seafood');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (15, 1, 6, 'Sparkling Wine', 30, 'Beverages');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (16, 2, 7, 'Bread Sticks', 30, 'Bread');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (17, 3, 5, 'Chicken Breast', 35, 'Meat');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (18, 4, 9, 'Lobster Tails', 10, 'Cleaning Supplies');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (19, 5, 6, 'Red Wine', 100, 'Beverages');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (20, 1, 1, 'Tomatoes', 100, 'Vegetables');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (21, 11, 9, 'Salmon Fillets', 25, 'Seafood');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (22, 4, 7, 'Baguettes', 40, 'Bread');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (23, 9, 6, 'Beef Tenderloin', 30, 'Meat');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (24, 14, 8, 'Lemons', 50, 'Fruit');

INSERT INTO Shipment (shipment_id, restaurant_id, supplier_id, product_name, amount, product_type)
VALUES (25, 12, 8, 'Tomatoes', 20, 'Vegetables');

-- Offers
INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (1, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 50, 'Get a 10% discount on your next order!', TO_DATE('2024-04-30', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (2, 2, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 30, 'Buy two main dishes and get a free dessert!', TO_DATE('2024-05-05', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (3, 3, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 20, 'Order an appetizer and a cocktail and get a 15% discount on the entire bill!!', TO_DATE('2024-05-10', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (4, 4, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 40, 'Book a dinner for two and receive a complimentary bottle of wine!', TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (5, 5, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 60, 'Order a full course meal and get a 20% discount on your next order!', TO_DATE('2024-05-20', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (6, 1, TO_DATE('2024-04-25', 'YYYY-MM-DD'), 45, 'Order two meat dishes and get a complimentary side!', TO_DATE('2024-05-25', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (7, 2, TO_DATE('2024-04-28', 'YYYY-MM-DD'), 35, 'Purchase a pizza and a beer and receive a 15% discount on the entire bill!', TO_DATE('2024-05-28', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (8, 3, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 25, 'Order a dessert and a coffee and receive an extra dessert for free!', TO_DATE('2024-06-01', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (9, 4, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 50, 'Book a dinner for four and receive a 25% discount on the entire bill!', TO_DATE('2024-06-05', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (10, 5, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 70, 'Order a wine tasting and receive a 30% discount on your next order!', TO_DATE('2024-06-10', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (11, 6, TO_DATE('2024-05-15', 'YYYY-MM-DD'), 55, 'Order a seafood platter and get a complimentary appetizer!', TO_DATE('2024-06-15', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (12, 7, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 40, 'Enjoy a 3-course meal and get a free glass of wine!', TO_DATE('2024-06-20', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (13, 8, TO_DATE('2024-05-25', 'YYYY-MM-DD'), 30, 'Order a pasta dish and get a complimentary salad!', TO_DATE('2024-06-25', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (14, 9, TO_DATE('2024-05-30', 'YYYY-MM-DD'), 60, 'Buy two steaks and get a free dessert!', TO_DATE('2024-06-30', 'YYYY-MM-DD'));

INSERT INTO Offers (offers_id, restaurant_id, starting_date, points, description, ending_date)
VALUES (15, 10, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 80, 'Order a seafood platter and receive a 25% discount on your next order!', TO_DATE('2024-07-05', 'YYYY-MM-DD'));

-- Accounts
INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (1, 10, 5, 2);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (2, 9, 15, 3);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (3, 8, 25, 3);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (4, 7, 35, 1);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (5, 6, 25, 2);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (5, 5, 15, 4);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (14, 4, 7, 6);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (3, 3, 12, 6);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (2, 2, 18, 5);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (1, 1, 40, 5);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (1, 6, 10, 3);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (2, 3, 20, 4);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (3, 7, 30, 2);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (4, 2, 25, 5);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (5, 10, 18, 4);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (2, 8, 22, 3);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (3, 5, 14, 4);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (1, 9, 8, 69);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (4, 6, 36, 28);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (5, 1, 42, 57);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (7, 11, 3, 15);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (8, 12, 2, 3);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (9, 13, 1, 10);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (10, 14, 4, 57);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (11, 15, 6, 76);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (15, 1, 5, 40);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (13, 10, 3, 21);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (14, 3, 6, 56);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (13, 2, 7, 40);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (7, 12, 4, 38);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (14, 14, 3, 27);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (13, 7, 2, 11);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (12, 5, 6, 56);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (12, 2, 1, 3);

INSERT INTO Account (restaurant_id, client_id, frequency, points)
VALUES (2, 15, 4, 44);
