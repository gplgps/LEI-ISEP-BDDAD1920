--1--

SELECT m1.nome, NVL(m2.NOME,' ') AS CHEFE
 FROM medicos m1
 LEFT JOIN medicos m2 ON m1.ID_MEDICO_CHEFE = m2.ID_MEDICO
 ORDER BY 1;

--2--
WITH especialidade_consultas as (SELECT e.*, TO_CHAR(c.data_hora, 'YYYY-MM-DD') AS DATA, COUNT(*) AS nr_consultas
                                  FROM ESPECIALIDADES e
                                  INNER JOIN MEDICOS m ON m.ID_ESPECIALIDADE = e.ID_ESPECIALIDADE
                                  INNER JOIN CONSULTAS c ON m.ID_MEDICO = c.ID_MEDICO
                                  GROUP BY e.DESIGNACAO, e.ID_ESPECIALIDADE, TO_CHAR(c.data_hora, 'YYYY-MM-DD'))

SELECT ec.ID_ESPECIALIDADE, ec.DESIGNACAO, ec.DATA
    FROM especialidade_consultas ec
    WHERE nr_consultas = (SELECT MAX(ec2.nr_consultas)
                            FROM especialidade_consultas ec2
                            WHERE ec.ID_ESPECIALIDADE = ec2.ID_ESPECIALIDADE
);

--3--

SELECT p.nome
    FROM PACIENTES p
    WHERE NOT EXISTS(SELECT m1.ID_MEDICO
                        FROM MEDICOS m1
                        WHERE UPPER(M1.HOSPITAL) LIKE 'PEDRO HISPANO'
                        MINUS
                        SELECT M2.ID_MEDICO
                            FROM CONSULTAS c
                            INNER JOIN medicos m2 ON c.ID_MEDICO = m2.ID_MEDICO
                            WHERE p.ID_PACIENTE = c.ID_PACIENTE);

--4--
WITH idade_medicos AS (SELECT m.nome, m.DATA_NASCIMENTO, TRUNC(MONTHS_BETWEEN(SYSDATE, m.DATA_NASCIMENTO )/ 12) as IDADE
                        FROM medicos m)

SELECT *
    FROM idade_medicos i
    WHERE i.IDADE IN (SELECT DISTINCT i2.IDADE
                        FROM idade_medicos i2
                        ORDER BY IDADE
                        FETCH FIRST 3 ROWS ONLY)
    ORDER BY 3;
