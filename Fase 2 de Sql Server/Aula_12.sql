create database Empresa_Noite

use Empresa_Noite

create table funcionarios(
	CodigoFunc int,
	NomeFunc  nvarchar(30),
	Cidade	  nvarchar(30),
	QuantFilhos	int)
	
insert into funcionarios (codigofunc, NomeFunc, cidade, QuantFilhos)
values (1, 'Ari','SBC',0)

insert into funcionarios (codigofunc, NomeFunc, cidade, QuantFilhos)
values (2, 'Eva','Diadema',0)

insert into funcionarios (codigofunc, NomeFunc, cidade, QuantFilhos)
values (3, 'Rui','SBC',0)

create table filhos(
	CodigoFunc	int,
	NomeFilho	nvarchar(30),
	AnoNasc		int)

create trigger SOMA_Filhos on filhos for insert as
begin
	declare @codigofunc int
	
	select @codigofunc = CodigoFunc from inserted
	
	update funcionarios set QuantFilhos = QuantFilhos + 1
						where CodigoFunc = @codigofunc
end

insert into filhos (CodigoFunc, NomeFilho, AnoNasc)
values(1, 'Luana', 2014)

insert into filhos (CodigoFunc, NomeFilho, AnoNasc)
values(1, 'Enzo', 2013)

insert into filhos (CodigoFunc, NomeFilho, AnoNasc)
values(2, 'Gabriela', 2013)

insert into filhos (CodigoFunc, NomeFilho, AnoNasc)
values(3, 'Vicente', 2014)

insert into filhos (CodigoFunc, NomeFilho, AnoNasc)
values(3, 'Marília', 2011)

insert into filhos (CodigoFunc, NomeFilho, AnoNasc)
values(3, 'Marcelo', 2014)

select * from filhos

select * from funcionarios

/************************************************************************************************************/
create database IndViDC

create table Creditos(
		Conta int primary key identity (1,1),
		Nome nvarchar(30),
		Credito	money default 1000)
		
insert into Creditos(Nome, Credito) values ('Mario', 5000)
insert into Creditos(Nome, Credito) values ('Alberto', 2000)
insert into Creditos(Nome, Credito) values ('Anderson', 800)

select * from Creditos

create table Emprestimo(
		Cod_Emp	int primary key identity(1,1),
		Conta	int,
		Valor	money,
		Data_Emp	date)
		
go
	create trigger TR_Emprestimo on Emprestimo after insert as
	begin
		declare @valorEmp money, @conta int
		
		select @valorEmp = Valor from inserted
		
		select @conta = Conta from inserted
		
		update Creditos set credito = Credito - @valorEmp where Conta = @conta
	end
	
select * from Creditos

insert into Emprestimo (Conta, Valor, Data_Emp) values (1, 200, '01/01/2013')
insert into Emprestimo (Conta, Valor, Data_Emp) values (2, 500, '02/01/2013')
insert into Emprestimo (Conta, Valor, Data_Emp) values (1, 300, '10/01/2013')

select * from Creditos

/**************************************************************************************************************************************/
create database Casas_Baiana

create table Caixa(
		Data_Caixa	datetime,
		Valor_Inicial	Decimal(12,2),
		Valor_Final		Decimal(12,2))

go
insert into Caixa
Values (CONVERT(Datetime, Convert(Varchar, getdate(), 103)), 100, 100)

go

create table Vendas(
		Data_da_Venda	datetime,
		Cod_Venda	int,
		Valor_Venda		decimal(12,2))
		
go

	create trigger

select * from Caixa

