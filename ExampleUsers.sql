-- -----------------------------------------------------
-- DROP DATABASE
-- -----------------------------------------------------
DROP DATABASE IF EXISTS ExampleUsers ;

-- -----------------------------------------------------
-- CREATE DATABASE
-- -----------------------------------------------------
CREATE DATABASE ExampleUsers DEFAULT CHARACTER SET utf8;
USE ExampleUsers ;

-- -----------------------------------------------------
-- TABLE users
-- -----------------------------------------------------
CREATE TABLE users(
	idUser BIGINT NULL AUTO_INCREMENT,
	username VARCHAR(250) NOT NULL,
	name VARCHAR(250) NOT NULL,
	lastname1 VARCHAR(250) NOT NULL,
	lastname2 VARCHAR(250) NOT NULL,
	pass VARCHAR(250) NOT NULL,

	-- KEYS
	PRIMARY KEY( idUser )
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- TABLE passwords
-- -----------------------------------------------------
CREATE TABLE passwords(
	idPassword BIGINT NOT NULL AUTO_INCREMENT,
	idUser BIGINT NOT NULL,
	password VARCHAR(250) NOT NULL,

	-- KEYS
	PRIMARY KEY( idPassword ),
	FOREIGN KEY( idUser ) REFERENCES users( idUser )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- TABLE orders
-- -----------------------------------------------------
CREATE TABLE orders(
	idOrder BIGINT NOT NULL AUTO_INCREMENT,
	date TIMESTAMP NOT NULL,
	status BOOLEAN NOT NULL DEFAULT 0,
	idUser BIGINT NOT NULL,

	-- KEYS
	PRIMARY KEY( idOrder ),
	FOREIGN KEY( idUser ) REFERENCES users( idUser )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- TABLE products
-- -----------------------------------------------------
CREATE TABLE products(
	idProduct BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	price DOUBLE NOT NULL,
	stock INT NOT NULL,

	-- KEYS
	PRIMARY KEY( idProduct )
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- TABLE orders_products
-- -----------------------------------------------------
CREATE TABLE orders_products (
	id BIGINT NOT NULL AUTO_INCREMENT,
	idOrder BIGINT NOT NULL,
	idProduct BIGINT NOT NULL,
	quantity INT NOT NULL,

	-- KEYS
	PRIMARY KEY( id ),
	FOREIGN KEY( idOrder ) REFERENCES orders( idOrder )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY( idProduct ) REFERENCES products( idProduct )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- INSERT USERS
-- -----------------------------------------------------
INSERT INTO users(name, username, lastname1, lastname2, pass) VALUES
	("pepe19", "Pepe", "Dominguez", "Hernandez", "admin"),
	("luci", "Lucia", "Fernandez", "Lopez", "admin"),
	("sarius", "Sara", "Fernandez", "Estevez", "admin"),
	("sito", "Luis", "Alvarez", "Lopez", "admin"),
	("adri12", "Adrian", "Fernandez", "Lopez", "admin"),
	("nurinu", "Nuria", "Alvarez", "Lopez", "admin"),
	("marquitos", "Marcos", "Arias", "Alvarez", "admin"),
	("micu", "Miguel", "Fernandez", "Lopez", "admin");


-- -----------------------------------------------------
-- INSERT PASSWORDS
-- -----------------------------------------------------
INSERT INTO passwords(idUser, password) VALUES
	(1, "admin2"),
	(1, "admin3"),
	(2, "admin2"),
	(3, "admin2"),
	(3, "admin3"),
	(3, "admin4"),
	(3, "admin5");


-- -----------------------------------------------------
-- INSERT ORDERS
-- -----------------------------------------------------
INSERT INTO orders(date, status, idUser) VALUES
	("2005-05-12", 1, 1),
	("2006-05-18", 1, 2),
	("2007-07-11", 0, 1),
	("2007-09-02", 1, 2),
	("2007-09-22", 0, 5),
	("2008-02-23", 0, 3),
	("2008-02-11", 1, 5);


-- -----------------------------------------------------
-- INSERT PRODUCTS
-- -----------------------------------------------------
INSERT INTO products(name, price, stock) VALUES
	("product1", 2.5, 100),
	("product2", 3, 200),
	("product3", 5, 300),
	("product4", 1.2, 200),
	("product5", 1.2, 150),
	("product6", 0.45, 25),
	("product7", 2.45, 0),
	("product8", 6, 50),
	("product9", 4.5, 0),
	("product10", 3, 50);


-- -----------------------------------------------------
-- INSERT ORDERS_PRODUCTS
-- -----------------------------------------------------
INSERT INTO orders_products(idOrder, idProduct, quantity) VALUES
	(1, 1, 1),
	(1, 2, 3),
	(1, 3, 1),
	(2, 5, 4),
	(2, 7, 2),
	(3, 1, 1),
	(4, 1, 1),
	(6, 4, 2),
	(7, 1, 1),
	(5, 9, 2);


-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------