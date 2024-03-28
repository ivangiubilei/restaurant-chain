-- Tables creation 
CREATE TABLE Restaurant(
    restaurant_id INT,
    phone_number INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    offers VARCHAR(255),
  primary key(restaurant_id)
);

CREATE TABLE Employee (
    employee_id INT,
    restaurant_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    rank VARCHAR(255) NOT NULL,
    birthday DATE,
    email VARCHAR(255) UNIQUE NOT NULL,
    employment_date DATE NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id),
    primary key(employee_id),
    CHECK (rank in ('director', 'chef', 'sous-chef', 'cooks', 'maitre', 'head-maitre', 'waiter', 'barman', 'cleaner'))
);

CREATE TABLE Supplier (
    supplier_id INT,
    supply_type VARCHAR(255) NOT NULL,
    company VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    primary key (supplier_id)
);

CREATE TABLE Shipment (
    shipment_id INT,
    restaurant_id INT NOT NULL,
    supplier_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    amount INT NOT NULL,
    product_type VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    primary key (shipment_id)
);

CREATE TABLE Client (
    client_id INT,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    birthday DATE,
    password VARCHAR(255) NOT NULL,
    primary key(client_id)
);

CREATE TABLE Account (
    restaurant_id INT,
    client_id INT,
    frequency INT NOT NULL,
    points INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant (restaurant_id),
    FOREIGN KEY (client_id) REFERENCES Client(client_id),
    PRIMARY KEY (restaurant_id, client_id)
);

CREATE TABLE Offers (
    offers_id INT,
    restaurant_id INT NOT NULL,
    starting_date DATE,
    points INT NOT NULL, 
    description VARCHAR (255),
    ending_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id),
    PRIMARY KEY (offers_id)
);
