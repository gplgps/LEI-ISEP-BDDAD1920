SELECT titulo
 FROM cd
 UNION ALL
 SELECT titulo
 FROM musicas;
 
SELECT titulo
 FROM cd
 UNION
 SELECT titulo
 FROM musicas;

SELECT titulo, LENGTH(titulo)
 FROM cd
 UNION
 SELECT titulo, LENGTH(titulo)
 FROM musicas
 ORDER BY 2 DESC;
 
SELECT titulo
 FROM cd
 INTERSECT
 SELECT titulo
 FROM musicas;
 
SELECT duracao
 FROM musicas
 WHERE UPPER(interprete) = 'PINK FLOYD'
 INTERSECT
 SELECT duracao
 FROM musicas
 WHERE UPPER(interprete) != 'PINK FLOYD';
 
SELECT duracao
 FROM musicas
 WHERE UPPER(interprete) = 'PINK FLOYD'
 INTERSECT
 SELECT duracao
 FROM musicas
 WHERE UPPER(interprete) != 'PINK FLOYD'
 ORDER BY 1 DESC;

SELECT id_editora
 FROM editoras
 MINUS
 SELECT id_editora
 FROM cd;