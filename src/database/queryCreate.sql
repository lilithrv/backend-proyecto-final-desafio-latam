CREATE DATABASE bookstore;
\c bookstore;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS communes;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS favorite_books;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS cart_details;


CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	lastname VARCHAR(50),
	email VARCHAR(100) UNIQUE NOT NULL,
	birthday DATE NOT NULL,
	password VARCHAR(60) NOT NULL,
	is_admin boolean NOT NULL DEFAULT FALSE
);

CREATE TABLE regions(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	delivery_price INT
);

CREATE TABLE communes(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	region_id INT REFERENCES regions(id) ON DELETE CASCADE
);

CREATE TABLE addresses(
	id SERIAL PRIMARY KEY,
	address VARCHAR(255) NOT NULL,
	commune_id INT REFERENCES communes(id) ON DELETE CASCADE,
	user_id INT REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE categories(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE authors(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE books(
	id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	image VARCHAR,
	description VARCHAR,
	price INT NOT NULL,
	stock INT NOT NULL,
	category_id INT REFERENCES categories(id) ON DELETE CASCADE,
	author_id INT REFERENCES authors(id) ON DELETE CASCADE
);

CREATE TABLE carts(
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	total INT,
	user_id INT REFERENCES users(id) ON DELETE CASCADE,
	address_id INT REFERENCES addresses(id) ON DELETE CASCADE,
	delivery_price INT
);

CREATE TABLE cart_details(
    id SERIAL PRIMARY KEY,
	quantity SMALLINT NOT NULL,
	price INT NOT NULL,
	sub_total INT NOT NULL,
    cart_id INT REFERENCES carts(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE
);

CREATE TABLE favorite_books(
 	id SERIAL PRIMARY KEY,
 	user_id INT REFERENCES users(id) ON DELETE CASCADE,
 	book_id INT REFERENCES books(id) ON DELETE CASCADE
);


