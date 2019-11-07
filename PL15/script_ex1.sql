CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirPrecosConsecutivosIguais
    BEFORE INSERT OR UPDATE ON PRECOS_EDICOES_LIVROS
    FOR EACH ROW
    DECLARE
        v_preco precos_edicoes_livros.preco%type;
        ex_preco_consecutivo EXCEPTION;
    BEGIN
        SELECT preco INTO v_preco
            FROM PRECOS_EDICOES_LIVROS
            WHERE DATA_INICIO < :new.data_inicio
            ORDER BY DATA_INICIO DESC
            FETCH FIRST ROW ONLY;

        if (:new.preco = v_preco) THEN
            raise ex_preco_consecutivo;
        end if;

        SELECT preco INTO v_preco
            FROM PRECOS_EDICOES_LIVROS
            WHERE DATA_INICIO > :new.data_inicio
            ORDER BY DATA_INICIO
            FETCH FIRST ROW ONLY;

        if (:new.preco = v_preco) THEN
            raise ex_preco_consecutivo;
        end if;

    EXCEPTION
        WHEN ex_preco_consecutivo THEN
            raise_application_error(-20001, 'Não é possível atribuir consecutivamente o mesmo preço');
    end;

INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco, data_hora)
     VALUES ('500-1234567891', TO_DATE('2020-04-01','YYYY-MM-DD'), 25, TO_DATE('2019-10-27 14:38:56','YYYY-MM-DD HH24:MI:SS'));

UPDATE PRECOS_EDICOES_LIVROS
SET preco = 22
WHERE preco = 25;

