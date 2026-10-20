drop DATABASE DB_ESCOLA_JOIN;
CREATE DATABASE DB_ESCOLA_JOIN;
USE DB_ESCOLA_JOIN;

CREATE TABLE Alunos (
    cod INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (cod, nome, cidade) VALUES
(1, 'Carlos', 'Sorocaba'),
(2, 'Beatriz', 'Itu'),
(3, 'Lucas', 'Votorantim');

-- Criando a tabela Matriculas
CREATE TABLE Matriculas (
    cod INT PRIMARY KEY,
    valor DECIMAL(10, 2),
    data DATE,
    cod_aluno INT,
    FOREIGN KEY (cod_aluno) REFERENCES Alunos(cod)
);

-- Inserindo dados na tabela Matriculas
INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(1, 180.00, '2023-10-10', 1),
(2, 250.00, '2023-10-11', 2),
(3, 400.00, '2023-10-12', 3);

INSERT INTO Alunos (cod, nome, cidade) VALUES
(4, 'Carlinhos', 'Sorocaba'),
(5, 'Bianca', 'Itu'),
(6, 'Bernardo', 'Itu'),
(7, 'Carla', 'Sorocaba'),
(8, 'Manuela', 'Sorocaba'),
(10, 'Luiza', 'Votorantim');

INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(4, 180.01, '2023-10-14', 4),
(5, 250.02, '2023-10-15', 5),
(6, 250.03, '2023-10-17', 6),
(7, 250.04, '2023-10-18', 7),
(8, 250.05, '2023-10-19', 8),
(10, 400.07, '2023-10-21', 10);

select * from Alunos;

select * from Matriculas;
-- 2
select
     Alu.cod as cod_aluno,
     Alu.cidade as cidade_aluno,
     Alu.nome as nome_aluno,
     Matr.valor as valor_Matr
from Alunos as Alu
inner join Matriculas Matr 
on Alu.cod = Matr.cod_aluno
order by Alu.cod, Matr.cod;
-- 3
select
     Alu.cod as cod_aluno,
     Alu.cidade as cidade_aluno,
     Alu.nome as nome_aluno,
     Matr.valor as valor_Matr,
      Matr.cod as cod_Matr
from Alunos as Alu
left join Matriculas Matr 
on Alu.cod = Matr.cod_aluno
order by Alu.cod, Matr.cod;
-- 4
select
     Alu.cod as cod_aluno,
     Alu.cidade as cidade_aluno,
     Alu.nome as nome_aluno,
     Matr.valor as valor_Matr,
	Matr.cod as cod_Matr
from Alunos as Alu
left join Alunos Alu
on Matr.cod_aluno = Alu.cod
order by Matr.cod, Alu.cod;
-- 5
select
     Alu.cod as cod_aluno,
     Alu.cidade as cidade_aluno,
     Alu.nome as nome_aluno,
     Matr.valor as valor_Matr,
     Matr.cod as cod_Matr
from Alunos as Alu
left join Matriculas Matr 
on Alu.cod = Matr.cod_aluno
where Matr.cod is null
order by Alu.cod, Matr.cod;
-- 6
select
     Alu.cod as cod_aluno,
     Alu.cidade as cidade_aluno,
     Alu.nome as nome_aluno,
     Matr.valor as valor_Matr,
     Matr.cod as cod_Matr
from Matriculas as Matr
left join Alunos Alu
on Matr.cod_aluno = Alu.cod
where Matr.valor > 200
order by Matr.cod, Alu.cod;

-- 7
select
     Alu.cod as cod_aluno,
     Alu.nome as nome_aluno,
     Matr.valor as valor_Matr,
     Matr.cod as cod_Matr
from Matriculas as Matr
inner join Alunos Alu
on Matr.cod_aluno = Alu.cod
where Matr.data between '2023-01-01' and '2023-12-31'
order by Matr.data, Alu.cod;






