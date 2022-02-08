create procedure Insere_Pedido (@codcli nvarchar(50),
								@codemp int,
								@orderdate date,
								@dias_para_Entrega int) as begin
								
	declare @datalimite date
	set @datalimite = DATEADD(DD, @dias_para_Entrega,@orderdate)
	
	insert into orders (CustomerID, EmployeeID, OrderDate, RequiredDate)
		values (@codcli, @codemp, @orderdate, @datalimite)
end

exec Insere_Pedido 'anton','1','02/02/02',46

--**********************************************************************************************

create procedure Somar (@val1 int, @val2 int)returns int
 as begin
	declare @soma int
	set @soma = @val1 + @val2
	return @soma
end

select dbo.somar(3,4)*2

-*********************************
--Monte uma função para calcular a área de um trapézio 

-/* área = (b maior + b menor) /2 * altura*/

go

create function AreaTrapezio (@maior float, @menor float, @altura float)
														returns float as
begin
   declare @area float
   set @area = (@maior + @menor) /2 * @altura
   return @area
 end
 go
 --teste da função
 select dbo.areatrapezio(2,3,2)
 --*************************************************
 --montar uma função para calcular a area de um triângulo
-/* area = base * altura / 2 */
creat function Triangulo (@base float, @altura float) returns float as 
begin
	declare @area float
	set @area = @base *  @altura/2
end
--teste da função
select dbo.Triangulo(2,3)

***********************************

-Calcular a media da FATEC
--Media = p1*0.35 + p2*0.45 + t*0.2
**********************************

create function mediafatec (@p1 float, @p2 float, @t float)
										returns float as
begin
	declare @media float
	sdet @media = @p1*0.35 + @p2*0.45 + @t*0.2
	return @media
	end
	go
--teste da função
select dbo.mediafatec(4,7,10)


creat table notas (
     nome nvarchar(
     p1 float,
     p2 float,
     t float
)

insert into notas (nome,p1,p2,t) values ('ANA',2,3,4)
insert into notas (nome,p1,p2,t) values ('EVA',5,6,7)
insert into notas (nome,p1,p2,t) values ('RUI',8,7,8)
insert into notas (nome,p1,p2,t) values ('BOB',7,2,5)
insert into notas (nome,p1,p2,t) values ('ZÉ',3,5,8)
insert into notas (nome,p1,p2,t) values ('CHICO',6,8,7)
insert into notas (nome,p1,p2,t) values ('ZEFA',10,10,1)

select * from notas
