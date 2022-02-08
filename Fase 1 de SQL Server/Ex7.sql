create table Cursos
(Cod_Curso  int,
 Descri��o  varchar(20),

 constraint PK_Curso primary key (Cod_Curso));

 create table Alunos
 (RA  int,
  Nome  varchar(20),
  Curso int,
  Tipo int,
  
  constraint PK_RA primary key (RA), 

  constraint FK_Curso foreign key (Curso) references Cursos (Cod_Curso),
  
  constraint FK_Tipo foreign key (Tipo) references Tipos (Cod_Tipo));

   create table Tipos
  (Cod_Tipo int,
   Tipo varchar(20),

   constraint PK_Cod_Tipo primary key (Cod_Tipo));
    
  select * from Cursos;

  select * from Alunos;

  select * from Tipos;

  insert into Cursos values
  (001,'Inform�tica'),
  (002,'Log'),
  (003,'Fabrica��o'),
  (004,'Polimeros');

  insert into Alunos values
  (12345,'Jo�o',001,500),
  (67890,'Marta',002,501),
  (36925,'Paulo',003,502);

  insert into Tipos values
  (500,'Bolsista'),
  (501,'Regular'),
  (502,'DP');

SELECT  alunos.RA, alunos.Nome, cursos.Descri��o
FROM alunos INNER JOIN cursos
ON alunos.Curso = Cursos.Cod_Curso;

select alunos.RA, alunos.Nome, Cursos.Descri��o
from Alunos inner join cursos
on alunos.Curso = Cursos.Cod_Curso
where Cursos.Descri��o = 'Inform�tica';

select alunos.RA, alunos.Nome, Cursos.Descri��o, Tipos.Tipo
from Alunos inner join cursos
on alunos.Curso = Cursos.Cod_Curso inner join Tipos
on alunos.Tipo = Tipos.Cod_Tipo;