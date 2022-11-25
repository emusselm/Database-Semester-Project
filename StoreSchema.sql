CREATE TABLE USERS 
(
	id		INT NOT NULL AUTO_INCREMENT,
    Fname		VARCHAR(15)	NOT NULL,	
    Lname		VARCHAR(15)	NOT NULL,
    email		VARCHAR(50) ,
    pass		VARCHAR (20),
    phoneNum 	VARCHAR(15),
    Primary Key(id)
);

CREATE TABLE IMAGE
(
	imageNum	INT NOT NULL AUTO_INCREMENT,
    imagePath	VARCHAR(1024),
    phrase		VARCHAR(2048),
    PRIMARY KEY(imageNum)
);

CREATE TABLE ADDRESS
(
	addressNum		INT NOT NULL AUTO_INCREMENT,
    userID			INT,
    street			VARCHAR(132),
    city			VARCHAR(32),
    state			CHAR(2),
    zip				INT,
    PRIMARY KEY(addressNum),
    FOREIGN KEY(userID) REFERENCES USERS(id),
	CONSTRAINT UC_ADDRESS UNIQUE (userID, street, zip)
);

CREATE TABLE ORDERS
(
	orderNum	INT NOT NULL AUTO_INCREMENT,
    orderDate	DATE,
    total		DECIMAL(10,2),
    userID		INT,
	FOREIGN KEY(userID) REFERENCES USERS(id),
    PRIMARY KEY(orderNum)
);    

CREATE TABLE SHIPPING
(
    shippingNum				INT NOT NULL AUTO_INCREMENT,
	orderID					INT,
    shippingAddressID		INT,
    PRIMARY KEY(shippingNum),
    FOREIGN KEY(orderID) REFERENCES ORDERS(orderNum),
	FOREIGN KEY(shippingAddressID) REFERENCES ADDRESS(addressNum)

);

CREATE TABLE PRODUCTS 
(
	itemNum	INT NOT NULL AUTO_INCREMENT,
    title		varchar(1024),
    price		DECIMAL(10, 2),
    merchType	varchar(30),
    merchImagePath	VARCHAR(1024),
    imgID		INT,
    PRIMARY KEY(itemNum),
    FOREIGN KEY(imgID) REFERENCES IMAGE(imageNum)
);

CREATE TABLE ORDER_DETAILS 
(
    itemID			INT ,
    quantity		INT,
    orderID			INT,
    FOREIGN KEY(orderID) REFERENCES ORDERS(orderNum),
    FOREIGN KEY(itemID) REFERENCES PRODUCTS(itemNum)
);

CREATE TABLE CART
(
	cartNum		INT NOT NULL AUTO_INCREMENT, 
    userID		INT,
    PRIMARY KEY(cartNum),
	FOREIGN KEY(userID) REFERENCES USERS(id)
);

CREATE TABLE CART_DETAILS
(
	cartID		INT,
    itemID		INT,
    quantity	INT,
    FOREIGN KEY(cartID) REFERENCES CART(cartNum),
    FOREIGN KEY(itemID) REFERENCES PRODUCTS(itemNum)
);

CREATE TABLE PAYMENT
(
    paymentNum	INT NOT NULL AUTO_INCREMENT,
	orderID		INT,
    payTime		DATETIME,
    cc_num		INT,
	securityCode		INT,
    holder_name		VARCHAR(64),
    expiration		INT,
    billingAddressID		INT,
    PRIMARY KEY(paymentNum),
    FOREIGN KEY(billingAddressID) REFERENCES ADDRESS(addressNum),
    FOREIGN KEY(orderID) REFERENCES ORDERS(orderNum)

);