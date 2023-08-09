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

-----------------------------------------------------------------------------------------------------------------------
create function products.getProductsByName(@name varchar(100), @user_id bigint)
returns TABLE
AS
return (
select p.name as product_name, p.id as product_id, p.description as description, p.list_price as list_price, p.sale_price as sale_price, p.in_store as in_store,
b.name as brand_name, c.name as category_name, s.name as shop_seller_name, ucc.quantity as quantity_in_cart
from ((((products.items p JOIN products.brands b on p.brand = b.id)
JOIN products.categories c on p.category =  c.id)
JOIN stores.retailers s on p.retailer = s.id)
LEFT JOIN (select * from users.customers_cart where user_id = @user_id ) ucc on p.id = ucc.product_id)
where p.name LIKE CONCAT('%',@name,'%')
)