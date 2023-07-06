create function users.checkMailPresent(@mail varchar(100))
returns @OUTPUT table(encry_password varchar(200), salt varchar(200), isMailPresent int, id bigint)
AS
BEGIN
 if exists (select * from users.customers where mail=@mail)
  BEGIN
   insert @OUTPUT
   select encry_password, salt, 1 as isMailPresent, id from users.customers where mail=@mail
   return
  END
 insert into @OUTPUT(isMailPresent) values(0)
 return
END

-----------------------------------------------------------------------------------------------------------------------
create function users.getUser(@userid bigint)
returns TABLE
AS
return (SELECT * FROM users.customers WHERE id=@userid)
