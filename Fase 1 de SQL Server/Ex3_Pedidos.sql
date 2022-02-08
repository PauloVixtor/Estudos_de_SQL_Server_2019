create table Clientes

(Cod_Cli	int,
 Nome		Varchar(30),
 Ender		varchar(40),
 Bairro		varchar(20),
 Cidade		varchar(20),
 Idade		int,

Constraint PK_Cod_Cli Primary Key (Cod_Cli));

create table Produto
 (Cod_Prod	int,
  Descrição varchar(20),
  Preço		numeric(9,2),

Constraint PK_Cod_Prod Primary Key (Cod_Prod));

create table Pedidos
  (Cod_Ped		int,
   Cod_Cli		int,
   Data			datetime,

constraint PK_Cod_Ped Primary Key (Cod_Ped),
constraint FK_Cod_Cli Foreign Key (Cod_Cli) references Clientes (Cod_Cli));

create table Itens_Pedido
   (Cod_Ped		int,
    Cod_Prod	int,
	Qtde		int,

constraint PK_Itens primary key (Cod_Ped, Cod_Prod),
constraint FK_Cod_Ped Foreign Key (Cod_Ped) references Pedidos (Cod_Ped),
constraint FK_Cod_Prod Foreign Key (Cod_Prod) references Produto (Cod_Prod));


select * from Clientes;

select * from Pedidos;

select * from Produto;

select * from Itens_Pedido;

insert into Clientes values
(120,'Natiele Neves', 'Rua das Acácias, 75','Oratório','Mauá',24),
(121,'Tassi Melo', 'Rua dos Ipês, 108','Nova Mauá','Mauá',31),
(122,'Júlia Silva', 'Rua das Rosas, 256','Vila Lucinda','Santo André',18),
(123,'João Silva', 'Alameda Lírio dÁgua, 512','Cerâmica','Sâo Caetano',46),
(124,'Rafael Alves', 'Av. dos Cravos, 1157','Piraporinha','Diadema',27);

insert into Produto values
(250,'Portuguesa',37.00),
(251,'4 Queijos',32.00),
(252,'Romeu & Julieta',45.00),
(253,'Calabresa',23.00),
(254,'Frango com Catupiry',25.00);

insert into Pedidos values
(501,120,'20180801'),
(502,121,'20180715'),
(503,122,'20180723'),
(504,123,'20180815'),
(505,124,'20180729');

insert into Itens_Pedido values
(501,250,4),
(502,253,3),
(503,252,2),
(504,251,7),
(505,254,5);


 -- D)
 select * from Produtos where Preço between 10 and 70;

 -- E)
 select AVG(Idade) as 'Média' from Clientes;

 -- F)
 

 -- G)
 select count(*) as 'Qtde' from Pedidos;

 -- J)
 select * from Clientes where Cidade in ('Mauá','Santo André', 'SBC','São Caetano');