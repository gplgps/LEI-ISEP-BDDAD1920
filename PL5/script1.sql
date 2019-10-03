--EXERCÍCIO A
--1
SELECT nome 
 FROM marinheiros
 WHERE idade = ( SELECT MAX(idade) FROM marinheiros); 

--2 
SELECT id_marinheiro, nome 
 FROM marinheiros
 WHERE id_marinheiro NOT IN (SELECT id_marinheiro FROM reservas)
 ORDER BY 1;
 
--3
SELECT id_marinheiro, nome, TRUNC(((SELECT AVG(idade) FROM marinheiros) - idade),0) "DIFERENCA_PARA_IDADE-_MEDIA"
 FROM marinheiros
 ORDER BY ABS(TRUNC(((SELECT AVG(idade) FROM marinheiros) - idade),0)) DESC;
 
--4
SELECT COUNT(*) "QTD_MARINHEIROS"
 FROM (SELECT r.id_marinheiro
        FROM reservas r
        INNER JOIN barcos b1 ON r.id_barco = b1.id_barco
        WHERE UPPER(b1.cor) LIKE 'VERMELHO'
        INTERSECT
         SELECT r.id_marinheiro
          FROM reservas r
          INNER JOIN barcos b2 ON r.id_barco = b2.id_barco
          WHERE UPPER(b2.cor) LIKE 'VERDE');
          
--5
SELECT data
 FROM reservas
 GROUP BY data
 HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                     FROM reservas
                     GROUP BY data);
                     
--EXERCÍCIO B
--1

SELECT m.id_marinheiro, m.nome, (SELECT COUNT(*)
                              FROM reservas r
                              WHERE m.id_marinheiro = r.id_marinheiro) "QTD_RESERVAS"
 FROM marinheiros m
 ORDER BY 3 DESC;
 
--2
SELECT r1.id_marinheiro, r1.id_barco, COUNT(*) "QTD_RESERVAS"
 FROM reservas r1
 GROUP BY r1.id_marinheiro, r1.id_barco
 HAVING COUNT(*) > (SELECT AVG(COUNT(*))
                     FROM reservas r2
                     WHERE r2.id_barco = r1.id_barco
                     GROUP BY r2.id_marinheiro);
                     
--3
SELECT DISTINCT m.nome
 FROM marinheiros m 
 INNER JOIN reservas r ON r.id_marinheiro = r.id_marinheiro
 WHERE NOT EXISTS (SELECT b.id_barco
                    FROM barcos b
                    WHERE b.nome LIKE 'Interlake'
                     MINUS
                     SELECT b.id_barco
                      FROM barcos b INNER JOIN reservas r ON b.id_barco = r.id_barco
                      WHERE b.nome LIKE 'Interlake' AND r.id_marinheiro = m.id_marinheiro);