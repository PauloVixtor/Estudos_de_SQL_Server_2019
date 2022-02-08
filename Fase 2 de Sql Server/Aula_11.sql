alter function posOUneg (@vali int) returns nvarchar (20) as
begin
	declare @resul nvarchar(20)
	if (@vali > 0)
	begin
		set @resul = 'Positivo'
	end
	else if (@vali < 0)
	begin
		set @resul = 'Negativo'
	end
	else
	begin
		set @resul = 'Zero'
	end
	return @resul
end

select dbo.posOUneg(3)
select dbo.posOUneg(0)
select dbo.posOUneg(-5)

---------------------------------------------------------------------------------------
/*Monte uma função que permita a entrada de:
	Valor do empréstimo,
	Taxa de juros mensal,
	Qtde de meses.
  Ao final apresente o valor do montante do empréstimo
  
-- 1000   2%   5 => 1104,08   */

create function JuroComposto (@valor float, @juro float,
					@meses int) returns float as begin
	declare @resultado float,
			@i int
	set @i=1
	while (@i <= @meses)
	begin
		set @valor = @valor * (1+ @juro/100)
		set @i = @i+1
	end
	return @valor
end

select dbo.JuroComposto (1000, 2, 5)

------------------------------------------------------------------------------------

create table AgendaAgiota(
   nome    nvarchar(30),
   valor   float,
   juro    float,
   tempo   int)

insert into AgendaAgiota values ('Lucas Silva', 2000,1,30)
insert into AgendaAgiota values ('Gênesis', 100000,4,36)
insert into AgendaAgiota values ('Rudy', 20000,2.5,40)
insert into AgendaAgiota values ('Emerson', 5000,0.5,12)
insert into AgendaAgiota values ('Vanessa', 3000,0.5,12)
insert into AgendaAgiota values ('Ednilson', 10000,1.5,18)

select * from AgendaAgiota


select *, ROUND(dbo.JuroComposto(valor,juro,tempo),2) from AgendaAgiota;

select *, ROUND(dbo.JuroComposto(valor,juro,tempo),2)-valor as 'valor do juros'
			  from AgendaAgiota

---------------------------------------------------------------------------------------------

/* Monte uma função que permita escrever o nome da
pessoa como em referencias bibliograficas.
ex: Ivan Carlos Pavão ==>> Pavão, Ivan Carlos */

go
create function RefBiblio (@nome nvarchar(100)) returns nvarchar(100)
begin
	declare @nomeFinal nvarchar(100),
			@i int,
			@letra nvarchar(1)
	set @nomeFinal = ''
	set @letra = ''
	set @i = len(@nome)
	while @i >= 1
	begin
		set @letra = substring(@nome, @i, 1)
		if @letra = ''
			break
		set @i = @i-1
	end
	set @nomeFinal = substring(@nome, @i, len(@nome) - @i + 1) + ' ,  ' +
												   substring(@nome, 0, @i)
	return @nomeFinal
end
go

select dbo.RefBiblio('Ivan Carlos Pavão')

go
select contactname, dbo.RefBiblio(contactname) from Customers

/* Monte uma função que permita a entrada de uma
string, e aplique a criptografia de César */

create function Criptografar(@texto nvarchar(100)) returns
									nvarchar(100) begin
	declare @i int,
			@textocrip nvarchar(100),
			@letra nchar
		set @i = 1
		set @textocrip = ' '
		while @i <= len(@texto)
		begin
			set @letra = substring (@texto, @i, 1)
			set @letra = char (ascii(@letra) + 3)
			set @textocrip = @textocrip + @letra
			set @i = @i + 1
		end
		return @textocrip
end

select dbo.Criptografar('Ivan')

select contactname, dbo.Criptografar(contactname) from Customers

create function Descriptografar(@texto nvarchar(100)) returns
									nvarchar(100) begin
	declare @i int,
			@textodescrip nvarchar(100),
			@letra nchar
		set @i = 1
		set @textodescrip = ' '
		while @i <= len(@texto)
		begin
			set @letra = substring (@texto, @i, 1)
			set @letra = char (ascii(@letra) - 3)
			set @textodescrip = @textodescrip + @letra
			set @i = @i + 1
		end
		return @textodescrip
end

select contactname, dbo.Descriptografar(contactname) from Customers

select dbo.Descriptografar('Pduld#Dqghuv')
