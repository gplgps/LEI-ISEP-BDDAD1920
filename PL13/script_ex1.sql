CREATE OR REPLACE TRIGGER trgClientesImpedirMenor18Anos
    AFTER INSERT OR UPDATE OF data_nascimento ON clientes
    FOR EACH ROW
    DECLARE
        ex_menor18 EXCEPTION;
    BEGIN
        IF TRUNC(MONTHS_BETWEEN(SYSDATE, :new.data_nascimento)/12) < 18 THEN
            RAISE ex_menor18;
        END IF;

    EXCEPTION
        WHEN ex_menor18 THEN
            raise_application_error(-20001, 'Utilizador com menos de 18 anos');
    end;


INSERT INTO clientes(nif_cliente, cod_postal, nome, data_nascimento, morada, nr_telemovel)
     VALUES (900800901, '4500-527', 'Carlos', TO_DATE('31-03-2017', 'DD-MM-YYYY'), 'Rua de Carvalhelhos 22',  '922267857');

UPDATE clientes
SET DATA_NASCIMENTO = TO_DATE('31-03-2017', 'DD-MM-YYYY')
WHERE NIF_CLIENTE = 900800900;

UPDATE clientes
SET DATA_NASCIMENTO = TO_DATE('31-03-2017', 'DD-MM-YYYY'), nome = 'Miguel'
WHERE NIF_CLIENTE = 900800900;