create table Cliente
(Cod_cli	int,
 Nome		varchar(30),
 Endereço	varchar(70),
 Fone		char(9),

constraint PK_Cli primary key (Cod_cli));

create table Produtos_Salão
 (Cod_Prod	int,
  Descrição	varchar(20),
  Preço		numeric(9,2),
  Qtde_Est	int,

constraint PK_ProdSalao primary key (Cod_Prod));

create table Funcionários
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
 
create table Serviços
 (Cod_Serv	int,
  Descrição	char(20),
  Preço		NUmeric(7,2),

constraint PK_Serv primary key (Cod_Serv));

create table Itens_Agendados
(Cod_Agd		int,
 Serviço		int,
 Funcionário	int,
 Horas			int,

 constraint PK_IAgd primary key (Cod_Agd, Serviço),
 constraint FK_Agd foreign key (Cod_Agd) references Agenda (Cod_Agd),
 constraint FK_Serv foreign key (Serviço) references Serviços (Cod_Serv),
 constraint FK_Func foreign key (Funcionário) references Funcionários (Cod_Func));

 select * from Cliente;

 select * from Produtos_Salão;

 select * from Funcionários;

 select * from Agenda;

 select * from Serviços;

 select * from Itens_Agendados;

 -- B)

insert into Cliente values
(150,'Natiele Neves','Rua das Acácias, 75, Oratório, Mauá',959863244),
(151,'Tassi Melo','Rua dos Ipês, 108, Nova Mauá, Mauá',945188039),
(152,'Júlia Silva','Rua das Rosas, 256, Vila Lucinda, Santo André',949662180),
(153,'João Silva','Alameda Lírio dÁgua, 512, Cerâmica, Sâo Caetano',998365547),
(154,'Rafael Alves','Av. dos Cravos, 1157, Piraporinha, Diadema',941509090);

insert into Produtos_Salão values
(021,'Tinta de Cabelo',15.99,50),
(022,'Shampoo',10.99,50),
(023,'Secador',399.90,8),
(024,'Chapinha',99.00,10),
(025,'Máquina de Corte',59.90,10);

insert into Funcionários values
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

insert into Serviços values
(301,'Corte de Cabelo',25.00),
(302,'Dia da Noiva',250.00),
(303,'Escova e Hidratação',80.00),
(304,'Pé e Mão',55.00),
(305,'Coloração',40.00);

insert into Itens_Agendados values
(201,302,1001,0900),
(202,305,1003,1600),
(203,305,1003,1700),
(204,301,1000,1030),
(205,301,1001,1130);

-- C)
select AVG (Preço) as 'Media' from Produtos_Salão;
select * from Produtos_Salão where Preço > 'Media';

-- D)
select max (Preço) as 'Maior Preço' from Produtos_Salão;
select * from Produtos_Salão where Preço = 'Maior Preço';

-- F)
select AVG (Preço) as 'Media' from Serviços;
select * from Serviços where Preço < 'Media';

-- G)
select count (*) as 'Qtde' from Funcionários;

-- H)
select count (*) as 'Qtde' from Produtos_Salão;

-- I)