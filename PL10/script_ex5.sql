CREATE OR REPLACE PROCEDURE procStockEdicaoLivro(p_isbn IN Edicoes_Livros.isbn%type) AS
    l_stock integer;
    l_stock_minimo integer;

BEGIN

    SELECT stock_min, stock INTO l_stock_minimo, l_stock
    FROM EDICOES_LIVROS WHERE ISBN = p_isbn;
    DBMS_OUTPUT.put_line('ISBN: ' || p_isbn);
    DBMS_OUTPUT.put_line('Stock: ' || l_stock);
    DBMS_OUTPUT.put_line('Stock minimo: ' || l_stock_minimo);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.put_line('O ISBN não existe');

end;

BEGIN
    procStockEdicaoLivro('500-1211111191');
end;

BEGIN
    procStockEdicaoLivro(123);
end;

BEGIN
    procStockEdicaoLivro(null);
end;