-- UNEMAT – Universidade Estadual do Mato Grosso
-- Josevaldo Moreira
-- Prof. Esp. Elton Ricelli Ferreira de Rezende
-- Disciplina de Banco de Dados (5º Semestre)
-- dbUniversidade

SHOW DATABASES;
USE dbUniversidade;

-- meu local 
-- /var/lib/mysql-files/
/*LOAD DATA INFILE '/var/lib/mysql-files/arquivosTxt/estado.txt'
INTO TABLE UF
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
(nomeUF, siglaUf);
select * from UF;*/

-- Inserir dados nas tabelas
INSERT INTO UF (nomeUF, siglaUf) VALUES 
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Minas Gerais', 'MG'),
('Bahia', 'BA'),
('Paraná', 'PR');
desc Cidade;

INSERT INTO Cidade (nomeCid, CodUF)
VALUES ('São Paulo', 1);
INSERT INTO Cidade (nomeCid, CodUF)
VALUES 
('Rio de Janeiro', 2),
('Belo Horizonte', 3),
('Salvador', 4),
('Curitiba', 5);
select * from Cidade;
INSERT INTO Bairro (NomeBairro, CodCid) VALUES 
('Centro', 1),
('Copacabana', 2),
('Savassi', 3),
('Pelourinho', 4),
('Centro Cívico', 5);
INSERT INTO Endereco (Logradouro, numero, CEP, CodBairro) VALUES 
('Av. Paulista', 1000, '01310100', 1),
('Av. Atlântica', 500, '22021010', 2),
('Rua Sergipe', 700, '30130171', 3),
('Rua Chile', 50, '40020000', 4),
('Rua Marechal Deodoro', 900, '80010010', 5);
INSERT INTO Aluno (nomeAluno, matricula, curso, codEnd) VALUES 
('João Silva', '2021001', 'Engenharia', 1),
('Maria Oliveira', '2021002', 'Medicina', 2),
('Carlos Santos', '2021003', 'Direito', 3),
('Ana Souza', '2021004', 'Arquitetura', 4),
('Pedro Lima', '2021005', 'Administração', 5);
INSERT INTO Professor (nomeProfessor, codEnd) VALUES 
('Dr. Eduardo Pereira', 1),
('Dra. Fernanda Costa', 2),
('Prof. João Almeida', 3),
('Prof. Carlos Nunes', 4),
('Dr. Antonio Ferreira', 5);
INSERT INTO Disciplina (nomeDisciplina, nrCreditos) VALUES 
('Matemática', 4),
('Biologia', 3),
('História', 2),
('Química', 3),
('Física', 4);
INSERT INTO Turma (anoLetivo, semestre) VALUES 
(2023, 1),
(2023, 2),
(2024, 1),
(2024, 2),
(2025, 1);
INSERT INTO Assunto (nomeAssunto, nrAulasAssunto) VALUES 
('Funções', 10),
('Genética', 8),
('Revolução Industrial', 6),
('Reações Químicas', 7),
('Mecânica Clássica', 9);
SELECT * FROM Professor;
INSERT INTO Aula (dataAula, codDisciplina, codTurma, codProfessor)VALUES 
    ('2024-08-10', 1, 1, 1),
    ('2024-08-11', 2, 2, 2),
    ('2024-08-12', 3, 3, 3),
    ('2024-08-13', 4, 4, 4),
    ('2024-08-14', 5, 5, 5);
INSERT INTO turmaAluno (codTurma, codAluno) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5);
INSERT INTO disciplinaAluno (codDisciplina, codAluno) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5);
INSERT INTO disciplinaProfessor (codDisciplina, codProfessor) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5);
INSERT INTO turmaProfessor (codTurma, codProfessor) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5);
INSERT INTO disciplinaTurma (codDisciplina, codTurma) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3),
    (4, 4);
INSERT INTO disciplinaAssunto (codDisciplina, codAssunto) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5);
