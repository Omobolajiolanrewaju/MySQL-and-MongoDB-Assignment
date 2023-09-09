CREATE DATABASE item_management_db;

USE item_management_db;

-- CREATION OF ALL THE ENTITIES 

CREATE TABLE category (
	id int,
    category_name varchar(255),
	description varchar(1000),
	PRIMARY KEY (id)
);

CREATE TABLE users (
	id int,
    name varchar(255),
	email varchar(255),
    gender ENUM('male', 'female'),
    phone_number varchar(255),
    password varchar(255),
    user_type ENUM('admin', 'user'),
	PRIMARY KEY (id)
) ;

CREATE TABLE items (
	id int,
    name varchar(255),
    description varchar(500),
    price varchar(255),
    size varchar(255),
    colour varchar(255),
    brand varchar(255),
    category_id int,
    FOREIGN KEY (category_id) REFERENCES category(id),
    PRIMARY KEY(id)
);

CREATE TABLE admins (
	id int,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id), 
    PRIMARY KEY (id)
);

-- Represents an order placed by a user. 
CREATE TABLE orders (
	id int,
    user_id int,
    total_amount varchar(255),
    order_date int,
    approved boolean DEFAULT false,
    delivered boolean DEFAULT false,
    canceled_order boolean DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

-- This relationship establishes which item is associated with each order item. When a user places an order, each OrderItem references a specific Item. This relationship ensures that you can retrieve details about the item included in an order, such as its name, description, and price, through the Item entity.
CREATE TABLE order_item (
	id int,
    order_id int,
    item_id int,
    quantity_ordered int,
    unit_price varchar(255),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    PRIMARY KEY (id)
);

-- This relationship allows admins to be associated with specific items they manage. Admins can create, update, view, and delete items that they are connected to via this relationship. It helps in implementing the access control that allows admins to perform actions on specific items.
CREATE TABLE admin_item (
	id int,
    admin_id int,
    item_id int,
    FOREIGN KEY (admin_id) REFERENCES admins(id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    PRIMARY KEY (id)
);

-- This relationship represents interactions between regular users and items. It could be used to track which items users have viewed, added to their carts, or marked as favorites. This information could be used to provide personalized recommendations or for analytics purposes.
CREATE TABLE user_item (
	id int,
    user_id int,
    item_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    PRIMARY KEY (id)
);

-- The "AdminOrder" relationship represents the association between admin users and the orders placed by regular users. Admins are responsible for reviewing and potentially approving or disapproving orders. This relationship allows multiple admins to manage orders, and an order can be reviewed by multiple admins.
CREATE TABLE admin_order (
	id int,
    admin_id int,
    order_id int,
    FOREIGN KEY (admin_id) REFERENCES admins(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    PRIMARY KEY (id)
);

SHOW TABLES; 

-- INSERTING RECORDS INTO THE ENTITIES

INSERT INTO users 
(id, name, email, gender, phone_number, password, user_type) 
VALUES (1, 'Rodney Bennett', 'rodney.bennett@gmail.com', 'male', '360-770-0263', '2e2ee9yc', 'user');

INSERT INTO users 
(id, name, email, gender, phone_number, password, user_type) 
VALUES (2, 'Carla Lane', 'carla.lane@gmail.com', 'female', '276-622-7095', 'idh3ife', 'user');

INSERT INTO category
(id, category_name, description) 
VALUES (1, 'Appliances', 'Simplify your life with our appliance collection. From kitchen gadgets to home essentials, find innovative solutions to everyday tasks. Upgrade your living space with energy-efficient appliances that make chores a breeze. Explore our selection and make your home smarter, more comfortable, and efficient. Discover convenience at your fingertips.');

INSERT INTO category
(id, category_name, description) 
VALUES (2, 'Phones & Tablets', 'In this section, you will find a selection of mobile phones and tablets. Whether you need to stay connected on the go or enjoy multimedia content, our Phone & Tablets section has you covered.');

INSERT INTO category
(id, category_name, description) 
VALUES (3, 'Gaming', 'Explore the latest video games, consoles, and accessories. Whether you are a casual player or a hardcore gamer, we have everything you need to level up your gaming experience. Discover new adventures, challenge friends, and immerse yourself in the excitement of the gaming universe.');

INSERT INTO items
(id, name, description, price, size, colour, brand, category_id)
VALUES (1, 'Microsoft Xbox One S/X Wireless Controller', 'wireless controller', '$ 46', 'small', 'white', 'microsoft', 3);

-- getting records from two or more entities

SELECT * FROM category;
SELECT * FROM items;
SELECT * FROM users;

-- Updating records from two or more entities
-- Changing the password of user 2
UPDATE users 
SET password = '#1234567' 
WHERE id = 2;

-- Changing the name of item 1 
UPDATE items 
SET name = 'Xbox One S/X Wireless Controller' 
WHERE id = 1; 

-- Deleting records from two or more entities 

-- DELETE FROM users
-- WHERE id = 2;

-- DELETE FROM items
-- WHERE id = 2;