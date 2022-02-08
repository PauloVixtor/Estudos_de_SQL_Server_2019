create table Cliente
(Cod_cli	int,
 Nome		varchar(30),
 Endere�o	varchar(70),
 Fone		char(9),

constraint PK_Cli primary key (Cod_cli));

create table Produtos_Sal�o
 (Cod_Prod	int,
  Descri��o	varchar(20),
  Pre�o		numeric(9,2),
  Qtde_Est	int,

constraint PK_ProdSalao primary key (Cod_Prod));

create table Funcion�rios
  (Cod_Func	int,
   Cargo char(20),
   Fone	char(9),

constraint PK_Func primary key (Cod_Func));

create table Agenda
(Cod_Agd	int,
 Data		datetime,
 Cliente	int,

constraint PK_Agd primary key (Cod_Agd),
constraint FK_Cli foreign key (Cliente) references Clientes (Cod_cli));
 
create table Servi�os
 (Cod_Serv	int,
  Descri��o	char(20),
  Pre�o		NUmeric(7,2),

constraint PK_Serv primary key (Cod_Serv));

create table Itens_Agendados
(Cod_Agd		int,
 Servi�o		int,
 Funcion�rio	int,
 Horas			int,

 constraint PK_IAgd primary key (Cod_Agd, Servi�o),
 constraint FK_Agd foreign key (Cod_Agd) references Agenda (Cod_Agd),
 constraint FK_Serv foreign key (Servi�o) references Servi�os (Cod_Serv),
 constraint FK_Func foreign key (Funcion�rio) references Funcion�rios (Cod_Func));

 select * from Cliente;

 select * from Produtos_Sal�o;

 select * from Funcion�rios;

 select * from Agenda;

 select * from Servi�os;

 select * from Itens_Agendados;

 -- B)

insert into Cliente values
(150,'Natiele Neves','Rua das Ac�cias, 75, Orat�rio, Mau�',959863244),
(151,'Tassi Melo','Rua dos Ip�s, 108, Nova Mau�, Mau�',945188039),
(152,'J�lia Silva','Rua das Rosas, 256, Vila Lucinda, Santo Andr�',949662180),
(153,'Jo�o Silva','Alameda L�rio d�gua, 512, Cer�mica, S�o Caetano',998365547),
(154,'Rafael Alves','Av. dos Cravos, 1157, Piraporinha, Diadema',941509090);

insert into Produtos_Sal�o values
(021,'Tinta de Cabelo',15.99,50),
(022,'Shampoo',10.99,50),
(023,'Secador',399.90,8),
(024,'Chapinha',99.00,10),
(025,'M�quina de Corte',59.90,10);

insert into Funcion�rios values
(1000,'Cabelereiro',998869500),
(1001,'Cabelereiro',966410032),
(1002,'Maquiador',955432050),
(1003,'Manicure',949678821),
(1004,'Pedicure',945712290);

insert into Agenda values
(201,'20180915',150),
(202,'20180928',151),
(203,'20180928',152),
(204,'20180914',153),
(205,'20180914',154);

insert into Servi�os values
(301,'Corte de Cabelo',25.00),
(302,'Dia da Noiva',250.00),
(303,'Escova e Hidrata��o',80.00),
(304,'P� e M�o',55.00),
(305,'Colora��o',40.00);

insert into Itens_Agendados values
(201,302,1001,0900),
(202,305,1003,1600),
(203,305,1003,1700),
(204,301,1000,1030),
(205,301,1001,1130);

-- C)
select AVG (Pre�o) as 'Media' from Produtos_Sal�o;
select * from Produtos_Sal�o where Pre�o > 'Media';

-- D)
select max (Pre�o) as 'Maior Pre�o' from Produtos_Sal�o;
select * from Produtos_Sal�o where Pre�o = 'Maior Pre�o';

-- F)
select AVG (Pre�o) as 'Media' from Servi�os;
select * from Servi�os where Pre�o < 'Media';

-- G)
select count (*) as 'Qtde' from Funcion�rios;

-- H)
select count (*) as 'Qtde' from Produtos_Sal�o;

-- I)