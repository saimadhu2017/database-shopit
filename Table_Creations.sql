CREATE SCHEMA users
CREATE TABLE users.customers(
 [first_name] varchar(50) not null,
 [last_name] varchar(50) not null,
 [id] bigint constraint pk_userid primary key identity,
 [mail] varchar(100) not null unique,
 [phone] varchar(10) not null,
 [country] varchar(50) not null,
 [dob] date,
 [age] tinyint constraint chk_age check(age>=13),
 [encry_password] varchar(200) not null,
 [salt] varchar(200) not null,
 [type] tinyint
)

-----------------------------------------------------------------------------------------------------------
CREATE SCHEMA stores
CREATE TABLE stores.retailers(
    [name] varchar(50) not null,
    [id] bigint constraint pk_retailerid primary key identity,
    [mail] varchar(100) not null unique,
    [phone] varchar(10) not null unique,
    [country] varchar(50) not null,
    [city] varchar(50) not null,
    [full_address] varchar(500) not null
)

-----------------------------------------------------------------------------------------------------------
CREATE SCHEMA products
CREATE TABLE products.categories(
    [name] varchar(100) not null unique,
    [id] bigint constraint pk_categories primary key identity
)

CREATE TABLE products.brands(
    [name] varchar(100) not null unique,
    [id] bigint constraint pk_brands primary key identity
)

CREATE TABLE products.items(
    [name] varchar(100) not null,
    [id] bigint constraint pk_items primary key identity,
    [in_store] int constraint chk_in_store CHECK([in_store]>=0),
    [retailer] bigint CONSTRAINT fk_stores_retailers REFERENCES stores.retailers(id) NOT NULL,
    [category] bigint CONSTRAINT fk_categories REFERENCES products.categories(id) NOT NULL,
    [brand] bigint CONSTRAINT fk_brands REFERENCES products.brands(id) NOT NULL,
    [list_price] numeric(10,2) not null,
    [sale_price] numeric(10,2),
    [image_store_url] sql_variant,
    [description] varchar(2000) not null
)