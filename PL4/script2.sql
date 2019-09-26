SELECT COUNT(*) "Quantidade"
 FROM cd
 GROUP BY local_compra;
 
SELECT DISTINCT COUNT(*) "QUANTIDADE"
 FROM cd
 GROUP BY local_compra;
 
SELECT local_compra, COUNT(*) "QUANTIDADE"
 FROM cd
 GROUP BY local_compra;
 
SELECT local_compra, COUNT(*) "QUANTIDADE"
 FROM cd
 GROUP BY local_compra
 ORDER BY 2;
 
SELECT local_compra, COUNT(*) "QUANTIDADE"
 FROM cd
 WHERE local_compra IS NOT NULL
 GROUP BY local_compra
 ORDER BY 2;
 
SELECT local_compra, COUNT(*) "QUANTIDADE", SUM(valor_pago) "TOTAL", MAX(valor_pago) "MAIOR"
 FROM cd
 WHERE local_compra IS NOT NULL
 GROUP BY local_compra
 ORDER BY 2;
 
SELECT cod_cd, interprete, COUNT(*) "QUANTIDADE"
 FROM musicas
 GROUP BY cod_cd, interprete
 ORDER BY 1;
 
SELECT COUNT(*) "QUANTIDADE"
 FROM musicas
 GROUP BY cod_cd, interprete
 HAVING COUNT(*) > 2;
 
SELECT local_compra, SUM(valor_pago) "TOTAL"
 FROM cd
 GROUP BY local_compra
 HAVING AVG(valor_pago) < 10;
 
SELECT local_compra, SUM(valor_pago) "TOTAL"
 FROM cd
 GROUP BY local_compra
 HAVING COUNT(*) > 2;
 
SELECT cod_cd, interprete
 FROM musicas
 GROUP BY cod_cd, interprete
 HAVING  COUNT(*) = 1
 ORDER BY 1;
 
SELECT DISTINCT interprete
 FROM musicas
 WHERE REGEXP_LIKE(interprete, '^[EL].*', 'i')
 GROUP BY cod_cd, interprete
 HAVING  COUNT(*) = 1
 ORDER BY 1;
 
SELECT cd.titulo, COUNT(musicas.nr_musica)
 FROM cd INNER JOIN musicas
 ON cd.cod_cd = musicas.cod_cd
 GROUP BY cd.titulo;
 
SELECT cd.cod_cd, cd.titulo, COUNT(musicas.nr_musica)
 FROM cd INNER JOIN musicas
 ON cd.cod_cd = musicas.cod_cd
 GROUP BY cd.titulo, cd.cod_cd;
 
SELECT cd.cod_cd, cd.titulo, COUNT(musicas.nr_musica)
 FROM cd INNER JOIN musicas
 ON cd.cod_cd = musicas.cod_cd
 WHERE musicas.duracao > 5
 GROUP BY cd.titulo, cd.cod_cd;
 
SELECT cd.cod_cd, cd.titulo, COUNT(musicas.nr_musica)
 FROM cd INNER JOIN musicas
 ON cd.cod_cd = musicas.cod_cd
 GROUP BY cd.titulo, cd.cod_cd
 HAVING COUNT(musicas.nr_musica) < 6;
 
SELECT cd.cod_cd, cd.titulo, COUNT(musicas.nr_musica)
 FROM cd INNER JOIN musicas
 ON cd.cod_cd = musicas.cod_cd
 GROUP BY cd.titulo, cd.cod_cd
 HAVING AVG(musicas.duracao) > 4;