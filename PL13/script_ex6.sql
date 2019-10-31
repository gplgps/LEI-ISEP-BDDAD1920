ALTER TABLE PRECOS_EDICOES_LIVROS ADD data_hora DATE;

CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirRegisto
    BEFORE INSERT OR UPDATE OR DELETE ON PRECOS_EDICOES_LIVROS
    FOR EACH ROW
    BEGIN
        IF DELETING THEN
            raise_application_error(-20004, 'Não podem ser eliminados listagens de preços de edições de livros.');
        ELSIF TRUNC(:new.DATA_INICIO) <= TRUNC(SYSDATE) THEN
            raise_application_error(-20005, 'Não pode alterar elementos de momentos anteriores ao atual.');
        END IF;
           :new.data_hora := SYSDATE;

    END;
/

INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco)
     VALUES ('500-1234567891', TO_DATE('2019-01-01','YYYY-MM-DD'), 70.00);

UPDATE PRECOS_EDICOES_LIVROS
SET DATA_INICIO = TO_DATE('2017-07-12 23:30','YYYY-MM-DD HH24:MI')
WHERE '500-1234567891' = ISBN;

DELETE FROM PRECOS_EDICOES_LIVROS
WHERE '500-1234567891' = ISBN;

INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco)
     VALUES ('500-1234567891', TO_DATE('2020-01-01','YYYY-MM-DD'), 70.00);

UPDATE PRECOS_EDICOES_LIVROS
SET preco = 10.00
WHERE '500-1234567891' = ISBN AND TO_DATE('2020-01-01','YYYY-MM-DD') = DATA_INICIO;