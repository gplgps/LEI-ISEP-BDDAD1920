CREATE OR REPLACE TRIGGER trgPrecosEdicoesLivrosImpedirPrecosConsecutivosIguais
    AFTER INSERT OR UPDATE ON PRECOS_EDICOES_LIVROS
    DECLARE
        ex_preco_consecutivo EXCEPTION;
        cur_precoIgual sys_refcursor;
        l_isbn_cur PRECOS_EDICOES_LIVROS.ISBN%type;
        l_isbn_nxt PRECOS_EDICOES_LIVROS.ISBN%type;
        l_preco_cur PRECOS_EDICOES_LIVROS.PRECO%type;
        l_preco_nxt PRECOS_EDICOES_LIVROS.PRECO%type;
    BEGIN
        OPEN cur_precoIgual FOR
        SELECT "isbn_cur", "isbn_nxt", "preco_cur", "preco_nxt"
            FROM (SELECT cu.ISBN AS "isbn_cur", cu.PRECO AS "preco_cur", ROW_NUMBER() OVER (ORDER BY ISBN) AS A
                    FROM PRECOS_EDICOES_LIVROS cu
                    ORDER BY ISBN) cur
                INNER JOIN (SELECT nx.ISBN AS "isbn_nxt", nx.PRECO AS "preco_nxt", ROW_NUMBER() OVER (ORDER BY ISBN) + 1 AS B
                                FROM PRECOS_EDICOES_LIVROS nx
                                ORDER BY ISBN) nxt ON cur.A = nxt.B
            ORDER BY cur."isbn_cur";

        LOOP
            FETCH cur_precoIgual INTO l_isbn_cur, l_isbn_nxt, l_preco_cur, l_preco_nxt;
            EXIT WHEN cur_precoIgual%notfound;
            IF ((l_isbn_cur LIKE l_isbn_nxt) AND (l_preco_cur = l_preco_nxt)) THEN
                raise ex_preco_consecutivo;
            end if;
        end loop;


    EXCEPTION
        WHEN ex_preco_consecutivo THEN
            raise_application_error(-20001, 'Não é possível atribuir consecutivamente o mesmo preço');
    end;

INSERT INTO precos_edicoes_livros(isbn, data_inicio, preco, data_hora)
     VALUES ('500-1234567891', TO_DATE('2020-03-01','YYYY-MM-DD'), 22, TO_DATE('2019-10-27 14:38:56','YYYY-MM-DD HH24:MI:SS'));

UPDATE PRECOS_EDICOES_LIVROS
SET preco = 25
WHERE preco = 22;

