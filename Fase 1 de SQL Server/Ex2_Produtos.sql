create table Produtos

(Cod_Prod		int,
 Descri��o		varchar(40),
 Pre�o			numeric(9,2),
 Qtde			int,
 Cor			char(20),
 constraint PK_Prod primary key (Cod_Prod));

 select * from Produtos;

 insert into Produtos values(
 123,'Pasta Cat�logo',4.50,500,'Cinza');

 insert into Produtos values
 (124, 'Caneta Esferogr�fica', 1.00,500,'Azul'),
 (125, 'Caneta Esferogr�fica', 1.00,500,'Preto'),
 (126, 'Caneta Esferogr�fica', 1.00,500,'Vermelho'),
 (127, 'Caneta Esferogr�fica', 1.00,500,'Verde');

 insert into Produtos values
 (130, 'L�pis n� 2', 1.20,1000,'Preto'),
 (132, 'Lapiseira 0.5',5.00,500,'Preto'),
 (134, 'Lapiseira 0.7',4.50,500,'Azul');

 insert into Produtos values
 (133, 'Lapiseira 0.9',4.80,500,'Amarelo');

 insert into Produtos values
 (147, 'Mochila', 120.00,250,'Branco');

update Produtos 
set Pre�o=13.50
where Descri��o='Pasta Cat�logo';


 -- D)
 select * from Produtos
 where Pre�o between 10 and 50;

 -- L)
 select distinct Cor from Produtos;

 -- O)
 select * from Produtos where Descri��o like 'c%';

