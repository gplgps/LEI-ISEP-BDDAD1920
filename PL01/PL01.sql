--EXERCÍCIO A--
--1--
Select * From cd;

--2--
Select titulo, data_compra From cd;

--3--
SELECT data_compra FROM cd;

--4--
SELECT Distinct data_compra FROM cd;

--5--
SELECT cod_cd, interprete FROM musicas;

--6--
SELECT DISTINCT cod_cd, interprete FROM musicas;

--7--
SELECT data_compra as "Data de Compra" FROM cd;

--8--
SELECT titulo, valor_pago, TO_CHAR(((valor_pago * 0.23)/1.23),'999.99') as IVA FROM cd;

--9--
SELECT * FROM musicas WHERE cod_cd=2;

--10--
SELECT * FROM musicas WHERE cod_cd!=2;

--11--
SELECT * FROM musicas WHERE cod_cd=2 AND duracao>5;

--12--
SELECT * FROM musicas Where cod_cd=2 AND duracao BETWEEN 4 AND 6;

--13--
SELECT * FROM musicas Where cod_cd=2 AND duracao NOT BETWEEN 4 And 6;

--14--
SELECT * FROM musicas Where cod_cd in (1,3,5,6);

--15--
SELECT * from musicas where cod_cd not in (1,3,5,6);

--16--
SELECT * from cd where local_compra LIKE 'FNAC';

--17--
SELECT * from cd where local_compra NOT LIKE 'FNAC';

--18--
SELECT * from musicas Where interprete LIKE 'Orquestra%';

--19--
SELECT * from musicas Where interprete LIKE '%Y%';

--20--
SELECT * from musicas Where UPPER(titulo) LIKE '%DAL_';

--21--
SELECT * FROM musicas Where titulo LIKE '%\%%' ESCAPE '\';

--22--
SELECT * from musicas where REGEXP_LIKE (titulo,'^[bdh]','i');

--23--
Select * from cd where local_compra is null;

--24--
Select * from cd where local_compra is not null;

--EXERCÍCIO B--
--1--
SELECT titulo, data_compra FROM cd ORDER BY 1;

--2--
SELECT titulo, data_compra FROM cd ORDER BY 2 DESC;

--3--
SELECT titulo,local_compra FROM cd ORDER BY 2;

--4--
SELECT titulo,local_compra FROM cd ORDER by 2 DESC;

--5--
SELECT titulo, valor_pago, TO_CHAR(((valor_pago * 0.23)/1.23),'999.99') as IVA FROM cd ORDER BY 3 DESC;

--6--
SELECT titulo, data_compra FROM cd ORDER BY 2 DESC,1;

--EXERCÍCIO C--
--1--
SELECT COUNT(*) FROM musicas;

--2--
SELECT COUNT(DISTINCT local_compra) FROM cd;

--3--
SELECT SUM(valor_pago) FROM cd;

--4--
SELECT MAX(valor_pago) FROM cd;

--5--
SELECT MIN(valor_pago) FROM cd;

--6--
SELECT AVG(duracao) FROM musicas;

--EXERCÍCIO D--
--1--
SELECT C.titulo, M.titulo
 FROM cd C INNER JOIN musicas M on C.cod_cd = M.cod_cd;
 
--2--
SELECT C.titulo, M.titulo FROM cd C INNER JOIN musicas M on c.cod_cd = m.cod_cd Where m.nr_musica = 1;

--3--
SELECT m.nr_musica, m.titulo, m.duracao FROM cd C Inner Join musicas M on c.cod_cd = m.cod_cd where c.titulo LIKE 'Punkzilla'; 