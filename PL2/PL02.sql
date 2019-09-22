--EXERCÍCIO A--
--1--
SELECT * FROM equipas;

--2--
SELECT * FROM equipas WHERE id_equipa = 12;

--3--
SELECT id_equipa,nome FROM equipas;

--4--
SELECT id_treinador, nome, idade from treinadores where idade < 40;

--5--
SELECT * from experiencias where lower(escalao) LIKE 'juniores' OR anos > 10;

--6--
SELECT * from treinadores where idade between 45 AND 53 ORDER BY idade DESC;

--7--
SELECT * from bolas where lower(fabricante) LIKE 'reebok' OR lower(fabricante) LIKE 'olimpic';

--8--
SELECT * from treinadores where UPPER(nome) like 'A%';

--EXERCÍCIO B--
--1--
SELECT COUNT(*) from equipas;

--2--
SELECT COUNT(DISTINCT fabricante) from bolas;

--3--
SELECT COUNT(*) from treinadores where idade > 40;

--4--
SELECT MAX(idade) FROM treinadores;

--EXERCÍCIO C--
--1--
SELECT e.id_equipa
 FROM equipas e INNER JOIN bolas b on e.id_equipa = b.id_equipa where UPPER(b.fabricante) LIKE 'ADIDAS';
 
--2--
SELECT DISTINCT e.id_equipa
 FROM equipas e INNER JOIN bolas b on e.id_equipa = b.id_equipa where UPPER(b.fabricante) LIKE 'ADIDAS';

--3--
SELECT AVG(t.idade)
FROM treinadores t INNER JOIN experiencias ex on t.id_treinador = ex.id_treinador;

--4--
SELECT t.*
FROM treinadores t INNER JOIN experiencias ex on t.id_treinador = ex.id_treinador WHERE lower(ex.escalao) = 'juniores' AND ex.anos >= 5;

--5--
SELECT DISTINCT t.*,eq.*
 FROM equipas eq
 INNER JOIN experiencias ex ON eq.id_equipa = ex.id_equipa
 INNER JOIN treinadores t ON t.id_treinador = ex.id_treinador;
 
--6--
SELECT DISTINCT t.nome,t.telefone,eq.nome
 FROM equipas eq
 INNER JOIN experiencias ex ON eq.id_equipa = ex.id_equipa
 INNER JOIN treinadores t ON t.id_treinador = ex.id_treinador;
 
--7--
SELECT DISTINCT eq.*,t.*
 FROM equipas eq
 INNER JOIN experiencias ex ON eq.id_equipa = ex.id_equipa
 INNER JOIN treinadores t ON t.id_treinador = ex.id_treinador
 WHERE LOWER(eq.nome) = 'académico';
 
--8--
SELECT MAX(t.idade)
 FROM equipas eq
 INNER JOIN experiencias ex ON eq.id_equipa = ex.id_equipa
 INNER JOIN treinadores t ON t.id_treinador = ex.id_treinador
 WHERE LOWER(eq.nome) = 'académico';
 
--9--
SELECT SUM(ex.anos)
 FROM equipas eq
 INNER JOIN experiencias ex ON eq.id_equipa = ex.id_equipa
 INNER JOIN treinadores t ON t.id_treinador = ex.id_treinador
 WHERE LOWER(eq.nome) LIKE 'académico' AND LOWER(t.nome) LIKE 'antónio';