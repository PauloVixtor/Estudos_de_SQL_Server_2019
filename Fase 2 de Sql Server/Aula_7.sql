-- INNER JOIN - EXERCÍCIOS

--products e suppliers
select * from Products as p 
Inner Join suppliers as s
on p.SupplierID = s.SupplierID

--orders e employees
select * from Orders as o 
Inner Join Employees as e
on o.EmployeeID = e.EmployeeID

--orders e customers
select * from Orders as o
Inner Join Customers as c
on o.CustomerID = c.CustomerID

--order e order detail
select * from Orders as o
Inner Join [Order Details] as od
on o.OrderID = od.OrderID

--orders e shippers
select * from Orders as o
Inner Join Shippers as sh
on o.ShipVia = sh.ShipperID

-- products, suppliers e categories
select * from Products as p
Inner Join Suppliers as s
on p.SupplierID = s.SupplierID
Inner Join Categories as c
on p.CategoryID = c.CategoryID

-- orders, employees e customers
select * from Orders as o
Inner Join Employees as e
on o.EmployeeID = e.EmployeeID
Inner Join Customers as c
on o.CustomerID = c.CustomerID


-- Categories, Suppliers e Products
select * from Products as p
Inner Join Suppliers as s
on p.SupplierID = s.SupplierID
inner join Categories as c
on p.CategoryID = c.CategoryID

-- Categories, Suppliers, Order Details e Products
select * from Products as p
Inner Join Suppliers as s
on p.SupplierID = s.SupplierID
inner join [Order Details] as od 
on p.ProductID = od.ProductID
inner join Categories as c
on p.CategoryID = c.CategoryID

--*********************************************************
-- Monte as linhas de select p/ exibir os conteúdos abaixo 

--a) ver os produtos c/ preço maior que 100
select * from products where UnitPrice > 100

--b) ver os pedidos de hj
select * from orders where OrderDate = '13/02/2019'

--c) ver os pedidos c/ data maior ou igual a 01/01/2019
select * from orders where OrderDate >= '01/01/2019'

--d) ver os pedidos do cliente de codigo "Anton"
select * from Orders where CustomerID = 'Anton'
select COUNT(*) from Customers where CustomerID = 'anton'

--e) ver todos os produtos da categoria 3
select * from Products where CategoryID = 3

--f) ver todos os produtos do fornecedor 15
select * from Products where SupplierID = 15

--g) ver todos os clientes da Espanha (Spain)
select * from Customers 
where Country = 'Spain'

--h) ver todos os pedidos do Mês de fevereiro de 2019
select * from orders where OrderDate between '01/02/2019' and '20/02/2019'

--i) ver todos os funcionários que nasceram no mes de Janeiro
select FirstName, LastName, Month (birthdate)
as 'mês' from Employees
Where MONTH (BirthDate) = 1
order by 'mês' 

--j) contar a qtde de clientes agrupando-os por cidade
select city, COUNT(*) from Customers group by City