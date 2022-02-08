select * from Customers where Country = 'france'

-- ver os produtos com preço maior que 100
select * from products where UnitPrice > 100

-- ver os pedidos de hj
select * from orders where OrderDate = '13/02/2019'

-- ver os pedidos com a data maior ou igual a 01/01/2019
select * from orders where OrderDate >= '01/01/2019'

-- ver os produtos com preço maior que 30 e menor que 70
select * from products where UnitPrice > 30 and UnitPrice < 70

-- ver os pedidos de fevereiro de 2019
select * from orders where OrderDate >= '01/02/2019' and OrderDate <= '28/02/2019'

select * from orders where OrderDate between '01/02/2019' and '20/02/2019'

---------------
--comando LIKE
---------------

--PERMITE PESQUISAR POR PARTES DO TEXTO
select * from Customers where CompanyName like 'a%'
select * from Customers where CompanyName like '%on'
select * from Customers where CompanyName like '%iste'
select * from Customers where CompanyName like '%gourmet%'
select * from Customers where CompanyName like '[acl]%'
select * from Customers where CompanyName like '[a-c]%'
select * from Customers where CompanyName like '%w_ng%'

-- ver clientes da França, Alemanha e Espanha
select * from Customers where 
Country = 'france' or country = 'germany' or Country = 'spain'

select * from Customers where Country in ('france', 'germany','spain')

---------------------
--CAMPOS CALCULADOS
---------------------

select * from [Order Details]
select *, UnitPrice*quantity as 'Subtotal' from [Order Details]
select orderid,productid,unitprice,quantity, 
	UnitPrice*quantity as 'Subtotal', discount from [Order Details]

select orderid,productid,unitprice,quantity, UnitPrice*quantity as 'Subtotal',
	(UnitPrice*quantity) * (1-Discount) as 'Subtotal c/ Desconto', discount from [Order Details]

select firstname,birthdate from Employees
select firstname,birthdate, 2019-YEAR(BirthDate) as 'Idade' from Employees

-----------------------
--Funções de Agregação
-----------------------

--count

--Contar a qtde de clientes na cidade de Londres
select COUNT(*) from Customers where City = 'London'

--Contar a qtde de pedidos do cliente de codigo anton
select COUNT(*) from Customers where CustomerID = 'anton'

--contar a qtde de produtos que são bebidas (CategoryID = 1)
select COUNT(*) from products where CategoryID = 1

--sum
-- faz a somatória de valores
select SUM (UnitsInStock) from products

select sum (2019-YEAR(BirthDate)) as 'Idade' from Employees

--valor total do estoque
select SUM (unitPrice*UnitsInstock) from Products

--valor das bebidas no estoque
select SUM (unitPrice*UnitsInstock) from Products where CategoryID = 1

--********************************************
--AVG --- calcula a media de uma coluna

select AVG (UnitsInStock) from Products

select AVG (2019-YEAR(birthdate)) from Employees

--Média dos preços dos produtos
select * from Products

select AVG (unitprice) from Products

--Media dos preços das bebidas
select AVG (unitprice) from Products
where CategoryID = 1

--*******************************************
-- max -- Retorna o maior valor de uma coluna
--*******************************************

-- Qual o produto mais caro?
select MAX (UnitPrice) from products

select productName, unitprice from Products
where UnitPrice = (select MAX(UnitPrice) from Products)

-- qual fruto do mar mais caro?
select MAX(unitprice) from Products
where CategoryID = 8

select productName, unitprice from Products
where UnitPrice = (select MAX(UnitPrice) from Products
					where CategoryID = 8)

--******************************************
--MIN -- retorna o menor valor de uma coluna
--******************************************

-- Qual Produto é mais barato?
select Min (UnitPrice) from products

select productName, unitprice from Products
where UnitPrice = (select Min(UnitPrice) from Products)

--*********************
--INNER JOIN
--*********************

-- Products e Categories

select * from Products
as p INNER JOIN Categories
as c on p.CategoryID = c.CategoryID

--Products suppliers

select * from Products
as p INNER JOIN Suppliers
as s on p.SupplierID = s.SupplierID

--orders employees

select * from Orders
as o INNER JOIN Employees
as e on o.EmployeeID = e.EmployeeID

--orders e [order details]

select * from Orders
as o INNER JOIN [Order Details]
as od on o.OrderID = od.OrderID

-- customers e orders

select * from Customers
as cus INNER JOIN Orders
as o on cus.CustomerID = o.CustomerID

--suppliers products categories

select * from Suppliers
as s INNER JOIN Products
as p on s.SupplierID = p.SupplierID
INNER JOin Categories
as c on p.CategoryID = c.CategoryID
