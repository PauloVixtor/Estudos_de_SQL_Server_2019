create table Clientes_Transp
(Cod_Cli	int,
 Nome		varchar(30),
 Endereço	varchar(40),
 Cidade		varchar(30),
 Fone		char(9),
 Idade		int,

 constraint PK_CodCli primary key (Cod_Cli));

 create table Transportadora
 (Cod_Transp	int,
  Nome			varchar(20),

  constraint PK_Cod_Transp primary key (Cod_Transp));

  create table Pedidos_Transp
  (Num_Ped	int,
   Cliente	int,
   Data_Entrega	datetime,
   Transport	int,
   Valor_Total	numeric(10,2),

   constraint PK_Num_Ped primary key (Num_Ped),

   constraint FK_Cli_Transp foreign key (Cliente) references Clientes_Transp (Cod_Cli),
   constraint FK_Transp foreign key (TRansport) references Transportadora (Cod_Transp));

   select * from Clientes_Transp;
   
   select * from Transportadora;

   select * from Pedidos_Transp;

insert into Clientes_Transp values
(150,'Maria da Conceição','Rua das Acácias, 75, Oratório','SBC',959863244,27),
(151,'Tassi Melo','Rua dos Ipês, 108, Nova Mauá','Mauá',945188039,25),
(152,'Júlia Silva','Rua das Rosas, 256, Vila Lucinda','Santo André',949662180,30),
(153,'João Silva','Alameda Lírio dÁgua, 512, Cerâmica','Sâo Caetano',998365547,33),
(154,'Rafael Alves','Av. dos Cravos, 1157, Piraporinha','Diadema',941509090,38);

insert into Transportadora values
(300,'ABC'),
(301,'FedEx'),
(302,'UPS'),
(303,'BrasPress'),
(304,'DHL');

insert into Pedidos_Transp values
(400,150,'20180930',301,2490.50),
(401,154,'20181005',300,3200.00),
(402,153,'20180927',304,5365.69),
(403,152,'20180815',303,4680.90),
(404,151,'20181011',302,4999.99);

-- C)
select * from Clientes_Transp where
Idade > (select avg(Idade) from Clientes_Transp);

-- D)
select * from Clientes_Transp where Idade between 20 and 50;

-- E)
select * from Clientes_Transp where
Cidade in ('Santo André','Mauá','SBC');

-- F)
select * from Pedidos_Transp where
Cliente > (select count (*) as '151' from Pedidos_Transp);

-- G)
select Num_Ped from Pedidos_Transp where
Data_Entrega > (select max(Data_Entrega) from Pedidos_Transp);

-- H)
select count (*) as 'Cidade' from Clientes_Transp
where Cidade = 'Mauá';

-- I)
select count (*) as 'Cod_Cli' from Clientes_Transp;

-- J)
select max (Idade) from Clientes_Transp;

-- K)
select distinct Cidade from Clientes_Transp;

-- L)
update Pedidos_Transp
set Valor_Total = (Valor_Total*1.1)
where Transport = 300;

-- M)
select * from Clientes_Transp where Nome like 'J%';

-- N)
delete from Pedidos_Transp
where Transport = 301;

-- O)
select Num_Ped,Data_Entrega from Pedidos_Transp;
select Nome from Clientes_Transp;