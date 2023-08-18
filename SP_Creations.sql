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
-----------------------------------------------------------------------------------------------------
create procedure users.addToCart(
 @product_id bigint,
 @user_id bigint,
 @quantity int
)
As
Begin
 Begin Try
  if not exists (select * from users.customers_cart where product_id=@product_id and user_id=@user_id)
   Begin
    insert into users.customers_cart values(@product_id, @user_id, @quantity)
   End
  else
   Begin
    if(@quantity=0)
     Begin
	  delete from users.customers_cart where product_id=@product_id and user_id=@user_id
	 End
    else
     Begin
      update users.customers_cart set quantity=@quantity where product_id=@product_id and user_id=@user_id
	 End
   End
  SELECT 1 as isCreated;
 End Try
 Begin catch
  SELECT 0 as isCreated;
 End catch
End