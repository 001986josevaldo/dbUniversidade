-- UNEMAT – Universidade Estadual do Mato Grosso
-- Josevaldo Moreira
-- Prof. Esp. Elton Ricelli Ferreira de Rezende
-- Disciplina de Banco de Dados (5º Semestre)
-- dbUniversidade

SHOW DATABASES;
USE dbUniversidade;

-- tabelas do banco
SHOW TABLES;

-- Exemplo de uso de select

-- select tabela cidade e uf, com registro das colunas nomeCid,nomeUF e siglaUF 
SELECT Cidade.nomeCid, UF.nomeUF, UF.siglaUf
FROM Cidade
JOIN UF ON Cidade.CodUF = UF.CodUF;

-- Select 
SELECT Bairro.NomeBairro, Cidade.nomeCid
FROM Bairro
JOIN Cidade ON Bairro.CodCid = Cidade.CodCid;

SELECT Endereco.Logradouro, Endereco.numero, Endereco.CEP, Bairro.NomeBairro
FROM Endereco
JOIN Bairro ON Endereco.CodBairro = Bairro.CodBairro;

SELECT Aluno.nomeAluno, Aluno.matricula, Aluno.curso, Endereco.Logradouro, Endereco.numero, Endereco.CEP
FROM Aluno
JOIN Endereco ON Aluno.codEnd = Endereco.CodEnd;


SELECT Professor.nomeProfessor, Endereco.Logradouro, Endereco.numero, Endereco.CEP
FROM Professor
JOIN Endereco ON Professor.codEnd = Endereco.CodEnd;

SELECT * FROM Disciplina;
SELECT * FROM Turma;
SELECT * FROM Assunto;
SELECT Aula.codAula, Aula.dataAula, Disciplina.nomeDisciplina, Turma.anoLetivo, Turma.semestre, Professor.nomeProfessor
FROM Aula
JOIN Disciplina ON Aula.codDisciplina = Disciplina.codDisciplina
JOIN Turma ON Aula.codTurma = Turma.codTurma
JOIN Professor ON Aula.codProfessor = Professor.codProfessor;

SELECT Turma.anoLetivo, Turma.semestre, Aluno.nomeAluno
FROM turmaAluno
JOIN Turma ON turmaAluno.codTurma = Turma.codTurma
JOIN Aluno ON turmaAluno.codAluno = Aluno.codAluno;

SELECT Aluno.nomeAluno, Disciplina.nomeDisciplina
FROM disciplinaAluno
JOIN Aluno ON disciplinaAluno.codAluno = Aluno.codAluno
JOIN Disciplina ON disciplinaAluno.codDisciplina = Disciplina.codDisciplina;

SELECT Professor.nomeProfessor, Disciplina.nomeDisciplina
FROM disciplinaProfessor
JOIN Professor ON disciplinaProfessor.codProfessor = Professor.codProfessor
JOIN Disciplina ON disciplinaProfessor.codDisciplina = Disciplina.codDisciplina;

SELECT Turma.anoLetivo, Turma.semestre, Professor.nomeProfessor
FROM turmaProfessor
JOIN Turma ON turmaProfessor.codTurma = Turma.codTurma
JOIN Professor ON turmaProfessor.codProfessor = Professor.codProfessor;

SELECT Disciplina.nomeDisciplina, Turma.anoLetivo, Turma.semestre
FROM disciplinaTurma
JOIN Disciplina ON disciplinaTurma.codDisciplina = Disciplina.codDisciplina
JOIN Turma ON disciplinaTurma.codTurma = Turma.codTurma;

SELECT Disciplina.nomeDisciplina, Assunto.nomeAssunto
FROM disciplinaAssunto
JOIN Disciplina ON disciplinaAssunto.codDisciplina = Disciplina.codDisciplina
JOIN Assunto ON disciplinaAssunto.codAssunto = Assunto.codAssunto;

SELECT codAluno, nomeAluno
FROM Aluno 
WHERE codAluno = 1;

-- update para atualizar o nome do aluno joao silva para joao silva souza
UPDATE Aluno
SET nomeAluno = 'João Silva Souza'
WHERE codAluno = 1;
SELECT codAluno, nomeAluno
FROM Aluno
WHERE codAluno = 1;

SELECT 
    a.codAluno,
    a.nomeAluno,
    e.Logradouro,
    e.numero,
    e.CEP,
    b.NomeBairro,
    c.nomeCid,
    u.nomeUF,
    u.siglaUF
FROM 
    Aluno a
JOIN 
    Endereco e ON a.codEnd = e.CodEnd
JOIN 
    Bairro b ON e.CodBairro = b.CodBairro
JOIN 
    Cidade c ON b.CodCid = c.CodCid
JOIN 
    UF u ON c.CodUF = u.CodUF
WHERE 
    a.codAluno = 1;

SELECT CodCid, nomeCid
FROM Cidade;
INSERT INTO Bairro (NomeBairro, CodCid)
VALUES ('Jd. Mato Grosso', 1);
UPDATE Endereco e
JOIN Aluno a ON a.codEnd = e.CodEnd
SET 
    e.Logradouro = 'Rua Barão do Rio Branco',
    e.numero = 522,
    e.CEP = '78700814',
    e.CodBairro = (
        SELECT CodBairro 
        FROM Bairro 
        WHERE NomeBairro = 'Jd. Mato Grosso'
        LIMIT 1
    )
WHERE 
    a.codAluno = 1;

SELECT 
    a.codAluno,
    a.nomeAluno,
    e.Logradouro,
    e.numero,
    e.CEP,
    b.NomeBairro,
    c.nomeCid,
    u.nomeUF,
    u.siglaUF
FROM 
    Aluno a
JOIN 
    Endereco e ON a.codEnd = e.CodEnd
JOIN 
    Bairro b ON e.CodBairro = b.CodBairro
JOIN 
    Cidade c ON b.CodCid = c.CodCid
JOIN 
    UF u ON c.CodUF = u.CodUF
WHERE 
    a.codAluno = 1;


SELECT * FROM Aluno WHERE codAluno = 1;

SELECT * FROM Endereco WHERE CodEnd = (SELECT codEnd FROM Aluno WHERE codAluno = 1);

SELECT CodBairro FROM Bairro WHERE NomeBairro = 'Jd. Mato Grosso';
