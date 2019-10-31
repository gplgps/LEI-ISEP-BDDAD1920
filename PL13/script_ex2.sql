CREATE OR REPLACE TRIGGER trgVendasImpedirAlteracoesForaExpediente
    AFTER INSERT OR UPDATE OF data_hora ON vendas
    FOR EACH ROW
    DECLARE
        ex_fim_semana EXCEPTION;
        ex_fora_horario EXCEPTION;
        l_dia_semana Number;
    BEGIN
        l_dia_semana := TO_NUMBER(TO_CHAR(:new.data_hora, 'd'));
        IF l_dia_semana IN (1, 7) THEN
            RAISE ex_fim_semana;
        END IF;
        IF TO_NUMBER(TO_CHAR(:new.data_hora, 'SSSSS')) NOT BETWEEN (60*60*9) AND (60*60*19) THEN
            RAISE ex_fora_horario;
        END IF;


    EXCEPTION
        WHEN ex_fim_semana THEN
            raise_application_error(-20002, 'Horário de fim de semana');
        WHEN ex_fora_horario THEN
            raise_application_error(-20003, 'Fora do horário permitido');
    end;
/
INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade)
     VALUES (15, 900800300, '500-1234567891', TO_DATE('2017-07-12 23:30','YYYY-MM-DD HH24:MI'),  1);

INSERT INTO vendas(nr_venda, nif_cliente, isbn, data_hora, quantidade)
     VALUES (15, 900800300, '500-1234567891', TO_DATE('2017-12-02 15:00','YYYY-MM-DD HH24:MI'),  1);

UPDATE VENDAS
SET DATA_HORA = TO_DATE('2017-07-12 23:30','YYYY-MM-DD HH24:MI')
WHERE NR_VENDA = 14;

UPDATE vendas
SET DATA_HORA = TO_DATE(CONCAT(TO_CHAR(DATA_HORA, 'DD-MM-YYYY'),CONCAT(' ', '68399')),'DD-MM-YYYY SSSSS')
WHERE TO_NUMBER(TO_CHAR(data_hora, 'SSSSS')) NOT BETWEEN (60*60*9) AND (60*60*19);