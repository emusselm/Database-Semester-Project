CREATE TABLE USERS 
(
	id		INT NOT NULL,
    Fname		VARCHAR(15)	NOT NULL,	
    Lname		VARCHAR(15)	NOT NULL,
    email		VARCHAR(50) ,
    pass		VARCHAR (20),
    phoneNum 	INT,
    Primary Key(id)
);

CREATE TABLE IMAGE
(
	imageNum	INT,
    imagePath	VARCHAR(1024),
    phrase		VARCHAR(2048),
    PRIMARY KEY(imageNum)
);

CREATE TABLE ADDRESS
(
	addressNum		INT,
    userID			INT,
    addrName		VARCHAR(64),
    city			VARCHAR(32),
    state			CHAR(2),
    zip				INT,
    PRIMARY KEY(addressNum),
    FOREIGN KEY(userID) REFERENCES USERS(id)
);

CREATE TABLE ORDERS
(
	orderNum	INT,
    orderDate	DATE,
    total		DECIMAL(10,2),
    userID		INT,
	FOREIGN KEY(userID) REFERENCES USERS(id),
    PRIMARY KEY(orderNum)
);    

CREATE TABLE SHIPPING
(
    shippingNum				INT,
	orderID					INT,
    shippingAddressID		INT,
    PRIMARY KEY(shippingNum),
    FOREIGN KEY(orderID) REFERENCES ORDERS(orderNum),
	FOREIGN KEY(shippingAddressID) REFERENCES ADDRESS(addressNum)

);

CREATE TABLE PRODUCTS 
(
	itemNum	INT,
    title		varchar(1024),
    price		DECIMAL(3, 2),
    merchType	varchar(30),
    merchImagePath	VARCHAR(1024),
    imgID		INT,
    PRIMARY KEY(itemNum),
    FOREIGN KEY(imgID) REFERENCES IMAGE(imageNum)
);

CREATE TABLE ORDER_DETAILS 
(
    itemID			INT,
    quantity		INT,
    orderID			INT,
    FOREIGN KEY(orderID) REFERENCES ORDERS(orderNum),
    FOREIGN KEY(itemID) REFERENCES PRODUCTS(itemNum)
);

CREATE TABLE CART
(
	cartNum		INT, 
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
    paymentNum	INT,
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