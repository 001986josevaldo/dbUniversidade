1. Introdução

Este documento descreve o trabalho realizado para inicio da criação e manter o banco de dados dbUniversidade. Inclui o processo de normalização do banco de dados, criação de tabelas, inserção de dados e operações de consulta e atualização.

2. Estrutura do Banco de Dados

2.1. Tabelas Principais
As seguintes tabelas foram criadas para representar a estrutura da universidade:

UF: Representa os estados federativos.
Cidade: Representa as cidades, associadas a um estado.
Bairro: Representa os bairros, associados a uma cidade.
Endereco: Representa os endereços, associados a um bairro.
Aluno: Representa os alunos, associados a um endereço.
Professor: Representa os professores, associados a um endereço.
Disciplina: Representa as disciplinas oferecidas.
Turma: Representa as turmas de um ano e semestre específicos.
Assunto: Representa os assuntos abordados nas disciplinas.
Aula: Representa as aulas ministradas, associadas a disciplinas, turmas e professores.
2.2. Tabelas de Relacionamento
turmaAluno: Relaciona alunos e turmas.
disciplinaAluno: Relaciona alunos e disciplinas.
disciplinaProfessor: Relaciona disciplinas e professores.
turmaProfessor: Relaciona turmas e professores.
disciplinaTurma: Relaciona disciplinas e turmas.
disciplinaAssunto: Relaciona disciplinas e assuntos.

3. Normalização

3.1. Primeira Forma Normal (1NF)
A 1NF foi atingida removendo grupos repetitivos e garantindo que cada coluna contenha valores atômicos.

3.2. Segunda Forma Normal (2NF)
A 2NF foi atingida removendo dependências parciais, garantindo que todos os atributos não-chave dependam da chave primária inteira.

3.3. Terceira Forma Normal (3NF)
A 3NF foi atingida removendo dependências transitivas, garantindo que todos os atributos não-chave dependam apenas da chave primária e não de outros atributos não-chave.

Tabelas Criadas

UF (Unidade Federativa)

CodUF: Código único para o estado (chave primária).
nomeUF: Nome do estado.
siglaUf: Sigla do estado.
Esta tabela armazena informações sobre os estados ou unidades federativas.

Cidade

CodCid: Código único para a cidade (chave primária).
nomeCid: Nome da cidade.
CodUF: Código do estado ao qual a cidade pertence (chave estrangeira referenciando UF).
Esta tabela relaciona as cidades com seus estados.

Bairro

CodBairro: Código único para o bairro (chave primária).
NomeBairro: Nome do bairro.
CodCid: Código da cidade onde o bairro está localizado (chave estrangeira referenciando Cidade).
Esta tabela contém informações sobre os bairros dentro das cidades.

Endereco

CodEnd: Código único para o endereço (chave primária).
Logradouro: Nome da rua ou logradouro.
numero: Número do endereço.
CEP: Código postal do endereço.
CodBairro: Código do bairro onde o endereço está localizado (chave estrangeira referenciando Bairro).
Esta tabela registra os endereços, vinculando-os a um bairro.

Aluno

codAluno: Código único para o aluno (chave primária).
nomeAluno: Nome do aluno.
matricula: Número de matrícula do aluno.
curso: Nome do curso em que o aluno está matriculado.
codEnd: Código do endereço do aluno (chave estrangeira referenciando Endereco).
Esta tabela armazena as informações dos alunos, incluindo o endereço associado.

Professor

codProfessor: Código único para o professor (chave primária).
nomeProfessor: Nome do professor.
codEnd: Código do endereço do professor (chave estrangeira referenciando Endereco).
Esta tabela contém as informações dos professores, incluindo o endereço associado.

Disciplina

codDisciplina: Código único para a disciplina (chave primária).
nomeDisciplina: Nome da disciplina.
nrCreditos: Número de créditos da disciplina.
Esta tabela armazena as disciplinas oferecidas pela universidade.

Turma

codTurma: Código único para a turma (chave primária).
anoLetivo: Ano letivo em que a turma está sendo oferecida.
semestre: Semestre (1 ou 2) do ano letivo em que a turma está sendo oferecida.
Esta tabela registra as turmas, com informações sobre o ano e semestre.

Assunto

codAssunto: Código único para o assunto (chave primária).
nomeAssunto: Nome do assunto.
nrAulasAssunto: Número de aulas para o assunto.
Esta tabela contém informações sobre os assuntos abordados nas disciplinas.

Aula

codAula: Código único para a aula (chave primária).
dataAula: Data em que a aula ocorre.
codDisciplina: Código da disciplina a que a aula pertence (chave estrangeira referenciando Disciplina).
codTurma: Código da turma em que a aula é ministrada (chave estrangeira referenciando Turma).
codProfessor: Código do professor que ministra a aula (chave estrangeira referenciando Professor).
Esta tabela registra as aulas, associando-as a disciplinas, turmas e professores.

Tabelas de Relacionamento

Estas tabelas estabelecem relacionamentos entre as principais tabelas:

turmaAluno: Relaciona alunos e turmas.
disciplinaAluno: Relaciona alunos e disciplinas.
disciplinaProfessor: Relaciona disciplinas e professores.
turmaProfessor: Relaciona turmas e professores.
disciplinaTurma: Relaciona disciplinas e turmas.
disciplinaAssunto: Relaciona disciplinas e assuntos.
Cada uma dessas tabelas usa chaves primárias compostas para gerenciar os relacionamentos entre as entidades principais do banco de dados.