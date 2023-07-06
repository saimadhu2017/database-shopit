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