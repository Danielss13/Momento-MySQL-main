-- ------ CÓDIGO COMENTADO -----------


-- ------- SELECT ----------------------
--
-- Seleção por id 
SELECT * FROM ocupacoes WHERE ocupacao_id = 9;  
--
-- Seleciona todos as linhas(valores) da tabela
SELECT * FROM ocupacoes;
--
-- Seleciona tudo(*) da tabela funcionarios "onde"(where) o campo primeiro_nome "como"(like) "Daniel" e(and) departamento_id = 6;
SELECT * FROM funcionarios WHERE primeiro_nome LIKE '%Daniel%' and departamento_id = 6; -- Filtragem de seleção com WHERE, LIKE e AND
--
/* COUNT() */
-- função COUNT(*), que retorna o número de linhas de acordo com o critério.
--
/* *** SINTAXE ***
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
 */
--
-- Contagem de quantos funcionarios tem na tabela funcionarios.  
SELECT COUNT(*) FROM funcionarios;  -- Contagem geral
--
-- Conta quantos funcionarios tem no departamento de id = 6
SELECT COUNT(*) FROM funcionarios WHERE departamento_id LIKE '%10%';  -- Contagem geral com condições WHERE e LIKE
--
-- Conta qual região tem mais países
SELECT regiao.regiao_name, COUNT(paises.regiao_id) FROM paises INNER JOIN regiao WHERE regiao.regiao_id = paises.regiao_id GROUP BY regiao.regiao_name;
--
--
--  ***** Seleção com INNER JOIN *****
SELECT dependentes.primeiro_nome, dependentes.sobrenome FROM funcionarios INNER JOIN dependentes WHERE funcionarios.funcionario_id = dependentes.funcionario_id AND funcionarios.primeiro_nome = 'Jose Manuel' AND funcionarios.sobrenome = 'Urman';
--
-- Seleciona da tabela dependentes o primeiro nome e o sobrenome e "junta" com a tabela funcionarios
-- ONDE(WHERE) funcionario_id for = funcionario_id da tabela dependentes E(AND) primeiro_nome e sobrenome
-- da tabela funcionarios. 
-- 
-- 
-- Exibe o nome de cada funcionário acompanhado de seus dependentes
SELECT funcionarios.primeiro_nome as nome, funcionarios.sobrenome, dependentes.primeiro_nome as dependentes 
FROM funcionarios INNER JOIN dependentes WHERE funcionarios.funcionario_id = dependentes.funcionario_id;
--
--
/* ----- AVG() -----
-- A AVG()função retorna o valor médio de uma coluna numérica. 
**** SINTAXE *****
 SELECT AVG(column_name)
FROM table_name
WHERE condition;
*/
--
-- Calcular a média salarial do departamento de tecnologia
SELECT AVG(salario) FROM funcionarios WHERE departamento_id = 6;
--
-- Calcular a média de dois campos 
SELECT AVG(salario) FROM funcionarios WHERE departamento_id = 1 OR departamento_id = 10;
--
-- Casa decimal
SELECT ROUND(AVG(CONVERT(salario, float))* 1, 2) FROM funcionarios WHERE departamento_id = 6;
--
--
/* ---- SUM() -----
-- função retorna a soma total de uma coluna numérica. 
--
******** SINTAXE *******
SELECT SUM(column_name)
FROM table_name
WHERE condition;
*/
--
-- Somar o valor total gasto em salarios pelo departamento de transportes
SELECT SUM(salario) FROM funcionarios WHERE departamento_id = 5;
--
--
-- /* ORDER BY/* --
/* 
ORDER BY organiza os resultados de acordo com uma ou mais colunas da tabela,
podendo definir a ordem do resultados como crescente(ASC) ou decrescente(DESC).
***Caso a ordem não seja declarada, será crescente (ASC), por padrão.***
*/

-- Ordena pelo campo "salario" ordem decrescente(DESC) e limite(limit) de resultados = 10
-- Caso não especificar limit, irá listar todas as linhas
SELECT * FROM funcionarios WHERE gerente_id = 100 ORDER BY salario DESC limit 10; -- Seleciona todos os registros que tem o gerente_id = 100 e ordena pelo Salario
--
--
--
-- /* GROUP BY /* --
/*
GROUP BY identifica uma coluna selecionada a ser usada para agrupar os resultados. 
Separa os dados em grupos pelos valores da coluna especificada e retorna uma linha
de resultados para cada grupo.
--
Utilizamos o GROUP BY quando estamos utilizando uma função de agregação(SUM, MAX, AVG,
COUNT...), então precisamos especificar no GROUP BY por quais campos queremos realizar
o agrupamento dos registros que estão sendo agregados.
*/
-- *** EXEMPLO ***
-- Qual região possui mais países?
SELECT regiao.regiao_name, COUNT(paises.regiao_id) FROM paises
INNER JOIN regiao WHERE regiao.regiao_id = paises.regiao_id 
GROUP BY regiao.regiao_name ORDER BY COUNT(paises.regiao_id) DESC;
-- Seleciona a coluna regiao_name da tabela regiao
-- COUNT(paises.regiao_id) faz a contagem de todas as linhas da coluna regiao_id da tabela paises. 
-- INNER JOIN faz a junção das tabelas paises e regiao.
-- WHERE(ONDE) regiao(tabela).regiao_id(coluna) = paises(tabela).regiao_id
-- GROUP BY regiao.regiao_name; Separa os dados por grupos, nesse caso, cada regiao_name terá os dados retornados de
-- forma individual.
-- ORDER BY DESC, ordena a exibição do maior para o menor
-- 
-- *** Sem utilizar o GROUP BY, o COUNT iria retornar o valor total, sem especificar os dados individuais ***
-- 
--
--  Qual departamento tem mais funcionários? 
SELECT departamento_name, COUNT(funcionarios.departamento_id) 
FROM funcionarios INNER JOIN departamento
WHERE departamento.departamento_id = funcionarios.departamento_id
GROUP BY departamento.departamento_name
ORDER BY COUNT(funcionarios.departamento_id) DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------------------
--
--
-- ---------- INSERT ---------------

-- Inserir valores do jeito padrão 
INSERT INTO funcionarios (`primeiro_nome`, `sobrenome`, `email`, `telefone`, `dataContratacao`, `ocupacao_id`, `salario`, `departamento_id`) VALUES
('Daniel','Santos','Ds5826391@gmail.com.com','080323232','2020-02-04', 9,'10000.00', 6);
--
-- Inserir valores utilizando o SELECT para campos que você 'não sabe' a especificação do campo que deseja inserir  
INSERT INTO funcionarios (`primeiro_nome`, `sobrenome`, `email`, `telefone`, `dataContratacao`, `ocupacao_id`, `salario`, `departamento_id`) VALUES
('Daniel','Santos','Ds5826391@gmail.com.com','080323232','2020-02-04',(SELECT ocupacao_id FROM ocupacoes WHERE ocupacao_title LIKE '%Desenvolvedor Web%'),'10000.00',(SELECT departamento_id FROM departamento WHERE departamento_name LIKE '%Tecnologia%'));
--
-- ------------------------------------------------------------------------------------------------------------------------------------------------
--
--
-- --------- UPDATE ----------------
-- Alterar um campo em específico
UPDATE `funcionarios` SET `salario` = '10000.00' WHERE `funcionario_id` = 207;
UPDATE `funcionarios` SET `gerente_id` = 100 WHERE `funcionario_id` = 207;
UPDATE `funcionarios` SET `gerente_id` = 100 WHERE `primeiro_nome` = 'Daniel' AND sobrenome = 'Santos';
--
-- Alterar o valor de todos os registros que tem o campo 'winner = 'True' para '1'.  
UPDATE oscar SET winner = '1' WHERE winner = 'True';
-- Alterar o valor do campo winner para '0' onde(where) for igual a 'False'
UPDATE oscar SET winner = '0' WHERE winner = 'False';
--
--
-- Alterando o salario dos funcionarios do departamento = 12 para a média salarial do departamento 1 e 10
UPDATE funcionarios SET salario=(SELECT AVG(salario) 
FROM funcionarios WHERE departamento_id = 10 OR departamento_id = 1) 
WHERE departamento_id = 12;
-- Dentro do SET ocorre todo o calculo para determinar a média salarial dos departamentos 1 e 10. 
-- Utilizamos parenteses() para englobar todo o calculo de média com a função AVG.
-- ------------------------------------------------------------------------------------------------------------------------------------------------
--
--
-- --------- DELETE ------------------
--
-- Deletar pelo ID
DELETE FROM funcionarios WHERE `funcionario_id` = 209;

-- Deletar todas as linhas, sem excluir a tabela. Se o campo
-- tiver uma foreign key irá dar erro
DELETE FROM dependentes;

