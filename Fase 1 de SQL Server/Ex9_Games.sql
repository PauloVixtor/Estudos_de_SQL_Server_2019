Create table Associados
(Cod_Assoc	int,
 Nome		varchar(40),
 Apelido	varchar(20),
 País		varchar(10),
 Região		char(25),
 Estado		char(2),
 Cidade		varchar(20),
 Email		varchar(30),
 Sexo		char(1),
 Data_Nasc	datetime,
 Data_Cad	datetime,

 constraint PK_Assoc primary key (Cod_Assoc));

Create table Genero
(Cod_Gen	int,
 Nome		varchar(40),

 constraint PK_Gen primary key (Cod_Gen));

create table Games
(Cod_Game	int,
 Nome		varchar(20),
 Genero		Int,
 Idade_Lim	int,

 constraint PK_Game primary key (Cod_Game),
 constraint FK_Genero foreign key (Genero) references Genero (Cod_Gen));

create table Grupos
(Cod_Grupo	int,
 Game		int,
 Data_Ini	datetime,
 Data_Fim	datetime,
 Max_Part	int,

 constraint PK_Grupo primary key (Cod_Grupo),
 constraint FK_Game foreign key (Game) references Games (Cod_Game));

create table Assoc_Grupo
(Cod_Gru	int,
 Cod_Associ	int,
 Pontos		int,

 constraint FK_Grupo foreign key (Cod_Gru) references Grupos (Cod_Grupo),
 constraint FK_Assoc foreign key (Cod_Associ) references Associados (Cod_Assoc));

select * from Associados;

select * from Genero;

select * from Games;

select * from Grupos;

select * from Assoc_Grupo;

insert into Associados values
(100,'Maria da Conceição','Ceiça','Brasil','Nordeste','PB','João Pessoa','maria.ceica@gmail.com','F','19901023','20150630'),
(101,'Tassitana Melo','Taz_Melo','Brasil','ABC','SP','SCS','melo.tassi@hotmail.com','F','19921220','20150801'),
(102,'Júlia Silva','Jujuh','USA','America do Norte','MC','Boston','silva_julia@msn.com','F','19990406','20160815'),
(103,'João Silva','Joaozinho','Portugal','Europa','DF','Lisboa','luiz.joao@gmail.com','M','19910629','20170517'),
(104,'Rafael Alves','R4F43L','Argentina','America do Sul','CO','Cordoba','rafa.melo@aol.com','M','20000521','20180110');

insert into Genero Values
(200,'Ação/Arcade'),
(201,'Corrida'),
(202,'Casual'),
(203,'RPG'),
(204,'Estratégia');

insert into Games values
(300,'Asphalt 9',201,10),
(301,'Clash of Clans',204,10),
(302,'PUBG',200,12),
(303,'Candy Crush Saga',202,10),
(304,'Real Racing 3',201,10);

insert into Grupos values
(400,300,'20180101','20180630',50),
(401,301,'20180115','20180405',50),
(402,302,'20170801','20180205',100),
(403,303,'20120501','20180715',25),
(404,304,'20120705','20140930',25);

insert into Assoc_Grupo values
(400,102,15530),
(401,101,7560),
(402,103,60230),
(403,100,12820),
(404,104,35875);

-- C)
select Nome, País
from Associados
where País = 'Brasil'
group by Nome, País;

-- D)
select Assoc_Grupo.Cod_Gru, Associados.Nome
from Assoc_Grupo inner join Associados
on Assoc_Grupo.Cod_Associ = Associados.Cod_Assoc;

-- E)
select Games.Cod_Game, Games.Nome, Genero.Nome
from Games inner join Genero
on Games.Genero = Genero.Cod_Gen;

-- F)
select País, count (*)
from Associados
group by País;

-- G)
select Nome, count (*)
from Associados
group by Nome;

-- H) select Nome, 


-- I)
select Games.Cod_Game, Games.Nome, Genero.Nome 
from Games inner join Genero 
on Games.Genero = Genero.Cod_Gen;

