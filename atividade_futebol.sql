/*Atividade de Futebol*/

/*1*/
SELECT AVG(pontos) AS media_pontos
FROM data_camp_brasileiro
WHERE posicao = 1;

/*2*/
SELECT COUNT(DISTINCT time) AS total_clubes
FROM data_camp_brasileiro;

/*3*/
SELECT time
FROM data_camp_brasileiro
WHERE ano BETWEEN 2015 AND 2024
GROUP BY time
HAVING COUNT(DISTINCT ano) = 10;

/*4*/
SELECT time, COUNT(*) AS vezes_vice
FROM data_camp_brasileiro
WHERE posicao = 2 AND ano BETWEEN 2009 AND 2018
GROUP BY time
ORDER BY vezes_vice DESC
LIMIT 1;

/*5*/
SELECT time, posicao
FROM data_camp_brasileiro
WHERE pontos = 65 AND vitoria = 18 AND derrotas = 9 AND posicao <= 4;

/*6*/
SELECT time, ano, posicao
FROM data_camp_brasileiro
WHERE aproveitamento = 50
ORDER BY posicao ASC
LIMIT 1;
   
/*7*/   
SELECT SUM(gols_pro) AS total_gols_vasco
FROM data_camp_brasileiro
WHERE time = 'Vasco';
