-- Cria a base de dados
CREATE DATABASE Teste;
-- Usa a base
USE Teste;
-- Cria tabela
CREATE TABLE Pessoas
(
-- Cria os atributos
	IdPessoa INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50),
	Pago VARCHAR(50)
)
-- Insere valores
INSERT INTO Pessoas(Nome, Pago)
VALUES('Jose', 'Sim'), ('Maria', 'Sim'), ('Joao', 'Não'), ('Caua', 'Não'), ('Clara', 'Sim')

-- Cria a procedure
USE Teste
GO
CREATE PROCEDURE Busca
AS
SELECT Nome, Pago
FROM Pessoas
WHERE Pago = 'Sim'
-- Executa a procedure
EXEC Busca;

--   Cria a tabela de CLIENTES que contém os dados pessoais dos clientes, incluindo nome, idade, endereço e salário, etc.,

CREATE TABLE CLIENTES (
   ID INT NOT NULL,
   NOME VARCHAR (100) NOT NULL,
   IDADE INT NOT NULL,
   ENDERECO CHAR (100),
   SALARIO DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

--   Insere valores tabela CLIENTE usando a instrução INSERT

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (1, 'Rafael Tavares Carvalho Nunes', 32, 'Rua Antônio 29112 - Riolândia, MT / 50351-513', 2500.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (2, 'Giovanni Alves Nascimento Almeida', 23, 'Avenida Moraes Travessa 549 - Planalto Alegre, AM / 32343-106', 1500.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (3, 'Marina Monteiro Mendes Melo', 32, 'Rua Nogueira Marginal 258 - Porto Franco, RN / 79767-148', 15000.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (4, 'Davi Marques Cardoso Farias', 27, 'Rua Braga Marginal 359 - Taparuba, ES / 11401-312', 18000.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (5, 'Raul Rosa Moraes Campos', 57, 'Rua Pereira Travessa 880 - Fátima, MG / 28364-788', 20000.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (6, 'Ramesh', 20, '464 Meire Travessa 464 - Varzelândia, GO / 21844-718', 6000.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (7, 'Pedro Henrique Barros Vieira ', 30, 'Avenida Franco Avenida 2623 - Paula Freitas, AP / 06388-907', 3000.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (8, 'Ana Melo Machado Nascimento', 28, 'Rua Benjamin Rodovia 429 - Rio Piracicaba, RO / 80213-535', 3500.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (9, 'Nicolly Vaz Martins Barros ', 25, 'Rua Rafaela Marginal 828 - Itirapina, SE / 37261-649', 4500.00 );

INSERT INTO CLIENTES(ID,NOME,IDADE,ENDERECO,SALARIO)
VALUES (10, 'Henrique Alves Dias Cunha', 32, 'Rua Lívia Marginal 509 - São Domingos do Maranhão, SC / 01454-672', 5000.00 );


--   Cria o stored procedure que recebe uma parâmetro de entrada e retorna um conjunto de resultados.

--   A consulta a seguir, cria o procedimento stored procedure com o nome 'ConsultaIdadeCliente' 

--   Em seguida, fornecemos a ele um único parâmetro de entrada chamado @IdadeCliente

--   O procedimento armazenado então seleciona todos os registros da tabela ‘CLIENTES’ onde o @IdadeCliente corresponde ao parâmetro de entrada.


CREATE PROCEDURE ConsultaIdadeCliente 
   @IdadeCliente INT
AS
BEGIN
   SELECT * FROM CLIENTES
   WHERE IDADE = @IdadeCliente
END

EXEC ConsultaIdadeCliente @IdadeCliente = 32




CREATE PROCEDURE ConsultaIdadeCliente2 
   @IdadeComparacao INT,
   @OperadorComparacao CHAR(1)
AS
BEGIN
   IF @OperadorComparacao = '>'
      SELECT * FROM CLIENTES WHERE IDADE > @IdadeComparacao
   ELSE IF @OperadorComparacao = '<'
      SELECT * FROM CLIENTES WHERE IDADE < @IdadeComparacao
   ELSE IF @OperadorComparacao = '='
      SELECT * FROM CLIENTES WHERE IDADE = @IdadeComparacao
   ELSE
      PRINT 'Operador de comparação inválido'
END

-- Para clientes com idade maior que 30
EXEC ConsultaIdadeCliente2 @IdadeComparacao = 30, @OperadorComparacao = '>'

-- Para clientes com idade menor que 30
EXEC ConsultaIdadeCliente2 @IdadeComparacao = 30, @OperadorComparacao = '<'

-- Para clientes com idade igual a 30
EXEC ConsultaIdadeCliente2 @IdadeComparacao = 30, @OperadorComparacao = '='

EXEC ConsultaIdadeCliente2 @IdadeComparacao = 30, @OperadorComparacao = '/'

