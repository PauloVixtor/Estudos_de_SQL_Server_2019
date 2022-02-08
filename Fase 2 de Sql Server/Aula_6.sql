----****** Função matematica ************-

--Retorna o valor absoluto--
select ABS (+2)
select ABS (0)
select ABS (-2)

--retorna o sinal de numero
select SIGN(2)
select SIGN(0)
select SIGN(-2)

-- calcula a raiz quadrada
select SQRT(9)
select SQRT(25)
select SQRT(400)
select SQRT(843795)

--retorna o seno de um numero
select SIN (0.5)
--retorna o arcseno de um numero
select asin (0.5)

-- valor de PI
select PI()

select SQRT(39800)

-- calcule a área de um círculo 5cm de raio
select PI()*5*5
select 3.14*5*5

select PI()*5000*5000
select 3.14*5000*5000

--retorna o quadrado de um numero
select SQUARE(8)
select SQUARE(11) 
select SQUARE(20) 

-- retorna o valor da potência
-- o 1º é a base
-- o 2º é o expoente
select POWER(2,3)
select POWER(5,2)
select POWER(3,4)
select POWER(2,10)

-- retorna valor aleatório
select RAND()
select RAND()*6

-- sorteia nºs de 1 a 6
select FLOOR(rand()*6+1)

--arredondamento
--floor - arrendonda para baixo retornando numero inteiro
select FLOOR (2.2)
select FLOOR (2.456)
select FLOOR (2.00001)
select FLOOR (2.999999999)

-- ROUND - Arredonda seguindo as regras matemáticas,
--		   e pode-se escolher a qtde de casas decimais
select ROUND(2.823645,5)
select ROUND(2.873645,1)
select ROUND(2.823645,3)
select ROUND(2.823645,4)
select ROUND(2.823645,0)






select productname, Unitprice,
		unitprice *1.027 as 'aumenta 2,7%',
		ROUND (unitprice *1.027,2) as 'aumenta 2,7% e arred'
		from Products
		
select productname, UnitPrice,
SQUARE(UnitPrice) from Products

--******************************************************************
--******************************************************************
-- FUNÇÕES DE STRING
--******************************************************************
--Retorna Qtde de caracteres
select LEN('Ivan Carlos Pavão')

--Retorna o código do caractere na tabela ASCII
select ASCII('a')
select ASCII('A')
select ASCII('1') 

-- retorna o caractere da tabela ascii de um nº
select CHAR(97)
select CHAR(65)
select CHAR(51)

--retirar espaços em branco da esquerda
select LTRIM ('			Paulo Victor				') +'Caminha'
--retirar espaços em branco da direita
select RTRIM ('				Paulo Victor				') +'Caminha'

select LTRIM(rtrim('	Paulo Victor	'))+'Caminha'


--transforma texto em minuscula
select LOWER('Tadeu Alves de Melo')

--transforma texto em maiuscula
select Upper('Tadeu Alves de Melo')

select UPPER(lastname)+','+ firstname from Employees
select UPPER(lastname)+','+ lower (firstname) from Employees

--acrescenta espaços
select 'Tadeu'+ SPACE(10)+'Alves'

--replica o texto a qtde de vezes indicada
select REPLICATE ('Tadeu ',8)

select 'Ted gord' + REPLICATE ('o',35)

--recorta da esquerda a qtde de caracteres indicados
-- de um texto
select LEFT('computador',4)

--recorta da direita a qtde de caracteres indicados
-- de um texto
select righT('computador',3)

--recorta uma frase determinando
-- o ponto inicial do corte e a qtde
-- a ser cortada de um texto
select SUBSTRING('computador',6,4)

--substitui um texto por outro
select REPLACE ('banana','n','t')

select REPLACE(replace('O Ted é chato', 'chato','gordo'),
						'Ted', 'Tadeu') + REPLICATE('o',10)
						
--retorna o grau de diferença entre as palavras
select DIFFERENCE('abacate','abacate')
select DIFFERENCE('abacate','abaca')
select DIFFERENCE('abacate','abacaxi')
select DIFFERENCE('abacate','morango')
select DIFFERENCE('abacate','zzzzzzzzz')

--inverte o texto
select REVERSE('Tadeu Alves')