DROP TABLE excecoes CASCADE CONSTRAINTS PURGE;

CREATE TABLE excecoes (
    ex_id int,
    ex_texto VARCHAR(500) CONSTRAINT nn_excecoes_ex_texto NOT NULL,
    CONSTRAINT pk_excecoes_ex_id PRIMARY KEY(ex_id),
    CONSTRAINT ck_excecoes_ex_id CHECK (ex_id BETWEEN -20999 AND -20000)

);

INSERT INTO excecoes(ex_id, ex_texto) VALUES (-20001,'Não são permitidos clientes com idade inferior a 18 anos.');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-20002,'Horário de fim de semana');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-20003,'Fora do horário de funcionamento');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-20004,'Não é permitido eliminações de preços');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-20005, 'Não são permitidos registos de preços anteirores à data atual.');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-20006, 'Não são permitidas modificações de registos de preços anteirores à data atual.');
INSERT INTO excecoes(ex_id, ex_texto) VALUES (-20007, 'Não é possível atribuir consecutivamente o mesmo preço.');