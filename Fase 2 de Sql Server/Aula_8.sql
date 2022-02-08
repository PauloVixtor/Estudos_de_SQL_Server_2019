select * from Customers where Country = 'usa'

create view cli_america as
select * from Customers where Country = 'usa'

select * from cli_america

--*******************************************************************************************************
alter view Clientes_Reduzido as
select CompanyName,ContactName,ContactTitle,Phone,Fax,Country from Customers

select * from Clientes_Reduzido where contacttitle = 'owner'

create view geral as
select o.OrderID,orderdate,cus.CompanyName as 'Nome_Cli',
	   FirstName+' '+LastName as 'Nome',ProductName,Quantity,od.UnitPrice,
	   Quantity*od.UnitPrice as 'SubTotal',s.CompanyName as 'Nome_Forn'
	   from products as p INNER Join Suppliers as s
						on p.SupplierID = s.SupplierID
						  INNER JOIN Categories as c
						on p.CategoryID = c.CategoryID
						  INNER JOIN [Order Details] as od
						on p.ProductID = od.ProductID
						  INNER JOIN Orders as o
						on od.OrderID = o.OrderID
						  INNER JOIN Employees as e
						on o.EmployeeID = e.EmployeeID
						  INNER JOIN Customers as cus
						on o.CustomerID = cus.CustomerID
						
select * from geral

go
create procedure Cliente_Cidade (@cidade nvarchar(20)) as begin
select * from Customers where City = @cidade end
						exec Cliente_Cidade 'Berlin'
						exec Cliente_Cidade 'London'
						exec Cliente_Cidade 'Campinas'
						
--1) Monte uma Stored Procedure p/ exibir os clientes
--   de um determinado País

go
create procedure ClienteporPais (@pais nvarchar(20)) as begin
select * from Customers where Country = @pais end
						execute ClienteporPais 'Brazil'
						
--2)Monte uma Stored Procedure p/ exibir os produtos de
--  uma determinada categoria (faça pelo código)

go
create procedure Produtos (@Categoria int) as begin
select * from Products where CategoryID = @Categoria end
						execute Produtos 2
						
--3) Monte uma Stored Procedure p/ exibir os pedidos de
--   um determinado cliente pelo código

go
create procedure Pedidos_Cli (@Cod_Ped nvarchar(20)) as begin
select * from Orders where CustomerID = @Cod_Ped end
						execute Pedidos_Cli 'anton'