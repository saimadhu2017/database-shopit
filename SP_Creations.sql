create procedure users.createUser(
 @first_name varchar(50),
 @last_name varchar(50),
 @mail varchar(100),
 @phone varchar(10),
 @country varchar(50),
 @encry_password varchar(200),
 @salt varchar(200),
 @dob date,
 @age tinyint,
 @type tinyint
)
As
Begin

 Begin try
  insert into users.customers(first_name,last_name,mail,phone,country,encry_password,salt,dob,age,type)
  values(@first_name,@last_name,@mail,@phone,@country,@encry_password,@salt, @dob, @age, @type);
  SELECT 1 as isCreated;
 End try
 Begin catch
  SELECT 0 as isCreated;
 End catch

End
---------------------------------------------------------
