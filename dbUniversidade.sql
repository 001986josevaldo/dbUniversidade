-- UNEMAT – Universidade Estadual do Mato Grosso
-- Josevaldo Moreira
-- Prof. Esp. Elton Ricelli Ferreira de Rezende
-- Disciplina de Banco de Dados (5º Semestre)
-- dbUniversidade


-- 
SHOW DATABASES;
-- Elimine o banco de dados existente, se existir
DROP DATABASE IF EXISTS dbUniversidade;
SHOW DATABASEs;
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS dbUniversidade;
SHOW DATABASES;
USE dbUniversidade;


-- ------------------ criação das estruturas ------------------
CREATE TABLE IF NOT EXISTS UF(
    CodUF INT AUTO_INCREMENT PRIMARY KEY,
    nomeUF VARCHAR(50) NOT NULL UNIQUE,
    siglaUf CHAR(2)
);
CREATE TABLE IF NOT EXISTS Cidade(
    CodCid INT AUTO_INCREMENT PRIMARY KEY,
    nomeCid VARCHAR(50) NOT NULL UNIQUE,
    CodUF INT,
    FOREIGN KEY (CodUF) REFERENCES UF(CodUF)
);
CREATE TABLE IF NOT EXISTS Bairro(
    CodBairro INT AUTO_INCREMENT PRIMARY KEY,
    NomeBairro VARCHAR(50) NOT NULL,
    CodCid INT,
    FOREIGN KEY (CodCid) REFERENCES Cidade(CodCid)
);

CREATE TABLE IF NOT EXISTS Endereco (
    CodEnd INT AUTO_INCREMENT PRIMARY KEY,
    Logradouro VARCHAR(70) NOT NULL,
    numero INT,
    CEP CHAR(8),
    CodBairro INT,
    FOREIGN KEY (CodBairro) REFERENCES Bairro(CodBairro)
);
CREATE TABLE Aluno (
    codAluno INT AUTO_INCREMENT PRIMARY KEY,
    nomeAluno VARCHAR(100),
    matricula VARCHAR(50),
    curso VARCHAR(100),
    codEnd INT,
    FOREIGN KEY (codEnd) REFERENCES Endereco(CodEnd)
);
CREATE TABLE Professor (
    codProfessor INT AUTO_INCREMENT PRIMARY KEY,
    nomeProfessor VARCHAR(100),
    codEnd INT,
    FOREIGN KEY (codEnd) REFERENCES Endereco(CodEnd)
);
CREATE TABLE Disciplina (
    codDisciplina INT AUTO_INCREMENT PRIMARY KEY,
    nomeDisciplina VARCHAR(100),
    nrCreditos INT
);
CREATE TABLE Turma (
    codTurma INT AUTO_INCREMENT PRIMARY KEY,
    anoLetivo INT,
    semestre INT
);
CREATE TABLE Assunto (
    codAssunto INT AUTO_INCREMENT PRIMARY KEY,
    nomeAssunto VARCHAR(100),
    nrAulasAssunto INT
);
CREATE TABLE Aula (
    codAula INT AUTO_INCREMENT PRIMARY KEY,
    dataAula DATE,
    codDisciplina INT,
    codTurma INT,
    codProfessor INT,
    FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina),
    FOREIGN KEY (codTurma) REFERENCES Turma(codTurma),
    FOREIGN KEY (codProfessor) REFERENCES Professor(codProfessor)
);
-- -------------------- RELACIONAMENTOS ---------------
CREATE TABLE turmaAluno (
    codTurma INT,
    codAluno INT,
    PRIMARY KEY (codTurma, codAluno),
    FOREIGN KEY (codTurma) REFERENCES Turma(codTurma),
    FOREIGN KEY (codAluno) REFERENCES Aluno(codAluno)
);
CREATE TABLE disciplinaAluno (
    codDisciplina INT,
    codAluno INT,
    PRIMARY KEY (codDisciplina, codAluno),
    FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina),
    FOREIGN KEY (codAluno) REFERENCES Aluno(codAluno)
);
CREATE TABLE disciplinaProfessor (
    codDisciplina INT,
    codProfessor INT,
    PRIMARY KEY (codDisciplina, codProfessor),
    FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina),
    FOREIGN KEY (codProfessor) REFERENCES Professor(codProfessor)
);
CREATE TABLE turmaProfessor (
    codTurma INT,
    codProfessor INT,
    PRIMARY KEY (codTurma, codProfessor),
    FOREIGN KEY (codTurma) REFERENCES Turma(codTurma),
    FOREIGN KEY (codProfessor) REFERENCES Professor(codProfessor)
);
CREATE TABLE disciplinaTurma (
    codDisciplina INT,
    codTurma INT,
    PRIMARY KEY (codDisciplina, codTurma),
    FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina),
    FOREIGN KEY (codTurma) REFERENCES Turma(codTurma)
);
CREATE TABLE disciplinaAssunto (
    codDisciplina INT,
    codAssunto INT,
    PRIMARY KEY (codDisciplina, codAssunto),
    FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina),
    FOREIGN KEY (codAssunto) REFERENCES Assunto(codAssunto)
);
show tables;