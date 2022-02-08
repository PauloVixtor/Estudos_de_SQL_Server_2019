create table VEICULOS

(Placa		char(7),
 Modelo		varchar(20),
 Fabricante varchar(20),
 Ano		int,
 Cor		varchar(20),
 Combustível varchar(20),
 Preço		numeric(10,2),
 constraint PK_Placa primary key (Placa));

 select * from Veiculos;

 insert into VEICULOS values (
 'GHM3362','Onix','GM - Chevrolet',2015,'Cinza','Flex',26.750);

 insert into VEICULOS values (
 'HDJ8841','Punto','Fiat',2013,'Vermelho','Flex',25.370);

 insert into VEICULOS values (
 'AFM9543','Gol','Volkswagen',2015,'Prata','Flex',29.990);

 insert into VEICULOS values (
 'AKU5236','Fiesta','Ford',2011,'Preto','Flex',20.499);

 insert into VEICULOS values (
 'EDJ1661','Focus','Ford',2005,'Prata','Gasolina',17.652);

 insert into VEICULOS values (
 'FTL3454','Ka','Ford',2004,'Azul','Gasolina',13.569);

 insert into VEICULOS values (
 'QHM9438','Etios','Toyota',2014,'Branco','Flex',27.379);

 insert into VEICULOS values (
 'AJK7436','Astra','GM - Chevrolet',2003,'Prata','Gasolina',20.109);

 insert into VEICULOS values (
 'BDK8497','Fox','Volkswagen',2008,'Preto','Flex',18.369);

 insert into VEICULOS values (
 'PJA2047','Yaris','Toyota',2018,'Azul','Flex',59.750);

 insert into VEICULOS values (
 'IGS2548','Palio','Fiat',2011,'Vermelho','Flex',21.550);


 -- C)
 select * from VEICULOS where Modelo like 'F%';

 -- D)
 select * from VEICULOS
 where Ano between 200 and 2008;
 
 -- E)
 select * from VEICULOS
 where Combustível='Flex';
 
 -- F)
 select * from VEICULOS
 where Fabricante='GM - Chevrolet' and Ano>2001;

 -- O)
 select distinct Fabricante from VEICULOS;

 -- G)
 SELECT AVG (Preço) AS 'MÉDIA' FROM VEICULOS;

 -- H)
SELECT MAX (Preço) AS 'MAIS CARO' FROM VEICULOS; 

-- I)
SELECT MIN (Preço) AS 'MAIS BARATO' FROM VEICULOS; 

-- K)
SELECT * FROM VEICULOS WHERE Cor='Prata';

-- L)
SELECT SUM (Preço) AS 'TOTAL'
 FROM VEICULOS;

-- N)
SELECT * FROM VEICULOS 
WHERE Fabricante IN('GM - Chevrolet','Ford','Toyota');