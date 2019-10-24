CREATE OR REPLACE FUNCTION funcStockAnoEditora(p_id_editora EDITORAS.id_editora%type, ano integer default EXTRACT(year from(SYSTIMESTAMP))) RETURN integer AS
    l_n_livros_stock integer;
    ex_ano_invalido EXCEPTION;
    l_editora_existe char(1);

    BEGIN
        if (ano > EXTRACT(year from(SYSTIMESTAMP))) then
            raise ex_ano_invalido;
        end if;

        SELECT 'y' into l_editora_existe
        FROM EDITORAS
        WHERE p_id_editora = ID_EDITORA;

        SELECT SUM(STOCK) INTO l_n_livros_stock
            FROM EDICOES_LIVROS
            WHERE p_id_editora = ID_EDITORA
                AND ANO_EDICAO = ano;
        return l_n_livros_stock;

    EXCEPTION
        WHEN ex_ano_invalido THEN
            RETURN null;
        WHEN NO_DATA_FOUND THEN
            RETURN null;
    end;

BEGIN
    if (funcStockAnoEditora(1500) IS null) then
        DBMS_OUTPUT.PUT_LINE('Editora e/ou ano inválidos');
    else
        DBMS_OUTPUT.PUT_LINE('A editora tem ' || TO_CHAR(funcStockAnoEditora(1500))|| ' livros em stock no ano atual.');
    end if;
end;

BEGIN
    if (funcStockAnoEditora(1500, 2016) IS null) then
        DBMS_OUTPUT.PUT_LINE('Editora e/ou ano inválidos');
    else
        DBMS_OUTPUT.PUT_LINE('A editora tem ' || TO_CHAR(funcStockAnoEditora(1500, 2016))|| ' livros em stock  em 2016.');
    end if;
end;

BEGIN
    if (funcStockAnoEditora(15) IS null) then
        DBMS_OUTPUT.PUT_LINE('Editora e/ou ano inválidos');
    else
        DBMS_OUTPUT.PUT_LINE('A editora tem ' || TO_CHAR(funcStockAnoEditora(15))|| ' livros em stock no ano atual.');
    end if;
end;