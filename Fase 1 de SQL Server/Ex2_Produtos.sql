create table Produtos

(Cod_Prod		int,
 Descrição		varchar(40),
 Preço			numeric(9,2),
 Qtde			int,
 Cor			char(20),
 constraint PK_Prod primary key (Cod_Prod));

 select * from Produtos;

 insert into Produtos values(
 123,'Pasta Catálogo',4.50,500,'Cinza');

 insert into Produtos values
 (124, 'Caneta Esferográfica', 1.00,500,'Azul'),
 (125, 'Caneta Esferográfica', 1.00,500,'Preto'),
 (126, 'Caneta Esferográfica', 1.00,500,'Vermelho'),
 (127, 'Caneta Esferográfica', 1.00,500,'Verde');

 insert into Produtos values
 (130, 'Lápis nº 2', 1.20,1000,'Preto'),
 (132, 'Lapiseira 0.5',5.00,500,'Preto'),
 (134, 'Lapiseira 0.7',4.50,500,'Azul');

 insert into Produtos values
 (133, 'Lapiseira 0.9',4.80,500,'Amarelo');

 insert into Produtos values
 (147, 'Mochila', 120.00,250,'Branco');

update Produtos 
set Preço=13.50
where Descrição='Pasta Catálogo';


 -- D)
 select * from Produtos
 where Preço between 10 and 50;

 -- L)
 select distinct Cor from Produtos;

 -- O)
 select * from Produtos where Descrição like 'c%';

