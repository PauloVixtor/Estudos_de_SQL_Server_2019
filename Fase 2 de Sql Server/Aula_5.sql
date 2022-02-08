--Qual o produto mais caro de cada categoria
select CategoryName, MAX (UnitPrice) as 'maior preço'
from products as p INNER JOIN Categories as c
on p.CategoryID = c.CategoryID
group by CategoryName

select CategoryName, MAX (UnitPrice) as 'maior preço',
					 MIN (UnitPrice) as 'menor preço',
					 AVG (UnitPrice) as 'média dos preços',
					 SUM (UnitPrice) as 'TOTAL'
from products as p INNER JOIN Categories as c
on p.CategoryID = c.CategoryID
group by CategoryName

--Qual o valor das vendas por funcionário
select FirstName, SUM (UnitPrice*Quantity) as 'TOTAL'
from [Order Details] as od INNER JOIN orders as o
on o.OrderID = od.OrderID
INNER JOIN Employees as e
on e.EmployeeID = o.EmployeeID
group by FirstName
order by TOTAL desc

--Qual o valor das vendas de 2018 por funcionario
select FirstName, SUM (UnitPrice*Quantity) as 'TOTAL'
from [Order Details] as od INNER JOIN orders as o
on o.OrderID = od.OrderID
INNER JOIN Employees as e
on e.EmployeeID = o.EmployeeID
where YEAR (OrderDate) = '2017'

group by FirstName
order by TOTAL desc

--Qual o valor das vendas de 2018 por funcionario
--Acrescentar  coluna de Bonus, sendo esta 2% do valor
select FirstName, SUM (UnitPrice*Quantity) as 'TOTAL',
				  SUM ((UnitPrice*Quantity)*0.02) as 'Bonus'
from [Order Details] as od INNER JOIN orders as o
on o.OrderID = od.OrderID
INNER JOIN Employees as e
on e.EmployeeID = o.EmployeeID
where YEAR (OrderDate) = '2017'

group by FirstName
order by TOTAL desc

--Qual a qtde de pedidos feitos a cada  ano
--OBS.: agrupe  por >> Year (OrderDate)
select YEAR (orderdate) as 'Ano' , COUNT (*) as 'quantidade'
			from Orders
			
			Group by YEAR (OrderDate)
			Order by 'Ano'
			
--Qtos clientes eu tenho em cada País
select Country as 'País', Count (*) as 'Qtde' from Customers 
						  group by Country
						  order by 'Qtde' desc
						  
--*******************************************************
--FUNÇÕES DATA E HORA
--*******************************************************

--YEAR - retorna o ano de uma data

select YEAR('21/05/1972')

select orderdate, YEAR (orderdate) from Orders
select FirstName, YEAR (birthdate) from Employees

--MONTH - retorna o mes de uma data
select Month ('21/05/1972')

select FirstName, Month (birthdate)as 'mês' from Employees
				order by 'mês'
				
--DAY - retorna o dia de uma data
select Day ('21/05/1972')

select FirstName, Day (birthdate)as 'dia' from Employees
				Where MONTH (BirthDate) = 1
				order by 'dia'
				
-------------------------------------------------------------------
--GETDATE - retorna a data corrente do sistema

select GETDATE()
select DAY(Getdate())
select MONTH (Getdate())
Select YEAR (Getdate())

select FirstName, YEAR(getdate()) - YEAR (BirthDate) as 'idade' from Employees

select SYSDATETIME()

/*
Intervalos
dd dia
mm mês
yy ano
hh hora
mi minuto
ss segundo
ms milisegundos
ns nanosegundos
ww nº da semana
dw dia da semana
dy dia do ano
qq trimestre
*/

select DATEPART (DD,GETDATE())
select DATEPART (MM,GETDATE())
select DATEPART (YY,GETDATE())

/**********************************************/
--		Intervalo, Qtde, Data

select DATEADD (DD, 40, GETDATE())
select DATEADD (DD, 80, GETDATE())
select DATEADD (DD, 120, GETDATE())

select DATEADD (mm, 9, GETDATE())

select DATEADD (yy, 5, GETDATE())

select DATEADD (hh, 52, GETDATE())

SELECT DATEADD (SS, 1000000, GETDATE())

--ALTERA O PADRAO DE DATA DO SISTEMA PARA DIA, MES E ANO
SET DATEFORMAT dmy