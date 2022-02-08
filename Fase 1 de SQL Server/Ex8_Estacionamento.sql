Create table Est_Cliente
(CPF	varchar(11),
 Nome	varchar(40),
 Nascto	datetime,

 constraint PK_CPF primary key (CPF));

create table Est_Modelo
 (Cod_Mod	int,
  Descr		varchar(40),

  constraint PK_CodMod primary key (Cod_Mod));

create table Est_Patio
(Num	int,
 Ender	varchar(40),
 Capacidade int,

 constraint PK_Num primary key (Num));

create table Est_Veiculo
(Placa	varchar(8),
 Cliente_CPF varchar(11),
 Modelo	int,
 Cor	varchar(20),

 constraint PK_Placa primary key (Placa),
 
 constraint FK_Cliente foreign key (Cliente_CPF) references Est_Cliente (CPF),
 constraint FK_Modelo foreign key (Modelo) references Est_Modelo (Cod_Mod));

create table Est_Estaciona
(Cod_Est	int,
 Patio_Num	int,
 Placa_Veic	varchar(8),
 Data_Entr	datetime,
 Data_Saida	datetime,
 Hora_Entr	varchar(10),
 Hora_Saida	varchar(10),

 constraint PK_Cod primary key (Cod_Est),

 constraint FK_Patio foreign key (Patio_Num) references Est_Patio (Num),
 constraint FK_Placa foreign key (Placa_Veic) references Est_Veiculo (Placa));

select * from Est_Cliente;

select * from Est_Modelo;

select * from Est_Patio;

select * from Est_Veiculo;

select * from Est_Estaciona;

insert into Est_Cliente values
('44466852101','Natiele Neves','19940503'),
('43077722690','Tassi Melo','19801220'),
('40090075421','Júlia Silva','19990406'),
('41139350073','João Silva','19800629'),
('47000362881','Rafael Alves','20000521');

insert into Est_Modelo values
(205,'Chevrolet Onix'),
(206,'Renault Sandero'),
(207,'VW Up!'),
(208,'Ford Ka'),
(209,'Fiat Argo');

insert into Est_Patio values
(301,'Av. dos Estados, 2351, Sto André',4000),
(302,'Rua dos Viannas, 1236, SBC',5500),
(303,'Av. Ragueb Chofi, 652, SCS',2500),
(304,'Av. Piraporinha, 1023 Diadema',1000),
(305,'Av. Barão de Mauá, 3628, Mauá',750);

insert into Est_Veiculo values
('AWG7713','44466852101',208,'Branco'),
('GNJ9965','43077722690',205,'Laranja'),
('HDJ1594','40090075421',209,'Vermelho'),
('PXC2051','41139350073',206,'Prata'),
('QWS5530','47000362881',207,'Preto');

insert into Est_Estaciona values
(501,301,'AWG7713','20181105','20181106','09:36:41','14:23:55'),
(502,302,'GNJ9965','20181030','20181108','10:51:25','18:15:36'),
(503,303,'HDJ1594','20181025','20181107','12:02:46','18:59:24'),
(504,304,'PXC2051','20181015','20181031','08:12:09','19:36:51'),
(505,305,'QWS5530','20181001','20181020','14:05:19','17:55:59');

-- C)
select Est_Veiculo.Placa, Est_Cliente.Nome
from Est_Veiculo inner join Est_Cliente
on Est_Veiculo.Cliente_CPF = Est_Cliente.CPF;

-- D)
select Est_Cliente.CPF, Est_Cliente.Nome
from Est_Cliente inner join Est_Veiculo
on Est_Cliente.CPF = Est_Veiculo.Cliente_CPF
where Placa = 'HDJ1594';

-- E)
select Est_Veiculo.Placa, Est_Veiculo.Cor
from Est_Veiculo inner join Est_Estaciona
on Est_Veiculo.Placa = Est_Estaciona.Placa_Veic
where Est_Estaciona.Cod_Est = 501;


-- G)
select Est_Veiculo.Placa, Est_Modelo.Descr
from Est_Veiculo inner join Est_Modelo
on Est_Veiculo.Modelo = Est_Modelo.Cod_Mod;

-- H)
select Est_Patio.Ender, Est_Estaciona.Data_Entr, Est_Estaciona.Data_Saida
from Est_Patio inner join Est_Estaciona
on Est_Patio.Num = Est_Estaciona.Cod_Est;

-- I)

