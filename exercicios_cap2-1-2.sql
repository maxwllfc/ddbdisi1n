/********** Exercícios do capítulo 2 **********/

/**** 1 ****/

/*a*/
SELECT nome, sobrenome FROM funcionarios
WHERE cargo = 'programador'; /*STRING ENTRE ASPAS!*/

/*b*/
SELECT nome, sobrenome FROM funcionarios
WHERE tempo_servico < 3;

/*c*/
SELECT nome, sobrenome FROM funcionarios
WHERE nome LIKE 'J%'; /*LIKE FICA DENTRO DO WHERE E O CARACTERE FICA DENTRO DE ASPAS SIMPLES!*/

/*d*/
SELECT nome, sobrenome FROM funcionarios
WHERE cargo = 'senior';

/*e*/
SELECT nome, sobrenome from funcionarios
WHERE salario BETWEEN 70000 and 90000;

/*f*/
SELECT nome, sobrenome, idade FROM funcionarios
WHERE (sobrenome LIKE 'A%' OR sobrenome LIKE 'S%') AND idade < 30;

/*g*/
SELECT nome, sobrenome, cargo FROM funcionarios
WHERE cargo != 'programador';

/*h*/
SELECT nome, sobrenome, idade FROM funcionarios
ORDER BY idade DESC
LIMIT 4;

/**** 2 ****/

/*a*/
SELECT nome as Nome_curso, credito as Créditos, valor as Preço FROM cursos

/*b*/
SELECT DISTINCT credito as Créditos FROM cursos

/*c*/
SELECT codigo, nome FROM cursos
WHERE valor BETWEEN 330 AND 400;

/*d*/
SELECT nome FROM cursos
WHERE nome like '%Software%';

/*e*/
SELECT nome, valor FROM cursos
WHERE valor <= 300;

/*f*/
SELECT nome, (credito + 6) AS novo_credito FROM cursos; /*Quando se faz uma conta no meio do atributo assim, ou muda algo, tem que dar um apelido com o AS.*/

/*g*/
SELECT nome, credito, valor FROM cursos
WHERE credito = 6 and valor > 200;