--suppliers, products e categories

select ProductID, ProductName, CompanyName,
CategoryName, UnitPrice, UnitsInStock
from Products as p inner join Categories as c
on p.CategoryID = c.CategoryID
inner join Suppliers as s
on p.SupplierID = s.SupplierID

--------------------------------------------------
-- group by
--------------------------------------------------
-- Contar a qtde "tipos de bebidas" que tenho no estoque
select COUNT(*) from products where CategoryID = 1

--Qtde das outras categorias
select COUNT(*) from products where CategoryID = 2
select COUNT(*) from products where CategoryID = 3
select COUNT(*) from products where CategoryID = 4
select COUNT(*) from products where CategoryID = 5
select COUNT(*) from products where CategoryID = 6
select COUNT(*) from products where CategoryID = 7
select COUNT(*) from products where CategoryID = 8

select COUNT(*) from products group by CategoryID

select CategoryID, COUNT(*) from products group by CategoryID

--exibe a legenda por NOME DA CATEGORIA
select CategoryName, COUNT(*) from Products
as p Inner join Categories as c
on c.CategoryID = p.CategoryID
group by CategoryName

--Qual a qtde de "tipos de produtos" agrupados por fornecedor
select CompanyName, COUNT(*)from Products 
as p inner join Suppliers as s
on s.SupplierID = p.SupplierID
group by CompanyName

--Qtde de "pedidos" vendidos por cada um dos "funcionarios"
select firstname, lastname, COUNT(*)
from orders as o inner join Employees
as e on o.EmployeeID = e.EmployeeID
group by FirstName, LastName

--Qtde de "pedidos" comprados por cada um dos "clientes"
select CompanyName,COUNT(*) as 'quantidade'
from orders as o Inner Join Customers as c
on o.CustomerID = c.CustomerID
group by CompanyName
order by quantidade desc

--Qtde de "pedidos" comprados por cada um "por país"
select Country,COUNT(*) as 'quantidade'
from orders as o Inner Join Customers as c
on o.CustomerID = c.CustomerID
group by Country
order by quantidade desc

--Qto cada cliente gastou na minha loja?
-- [order detail] --- orders --- customers

select CompanyName, SUM(unitprice * quantity) as 'valor'
from orders as o Inner Join [Order Details] as od
on od.OrderID = o.OrderID
Inner Join Customers as c
on c.CustomerID = o.CustomerID

group by CompanyName
order by valor desc

--Qto cada cliente gastou na minha loja EM 2018?
-- [order detail] --- orders --- customers

select CompanyName, SUM(unitprice * quantity) as 'valor'
from orders as o Inner Join [Order Details] as od
on od.OrderID = o.OrderID
Inner Join Customers as c
on c.CustomerID = o.CustomerID
where year (OrderDate) = '2018'

group by CompanyName
order by valor desc

