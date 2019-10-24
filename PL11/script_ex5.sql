CREATE OR REPLACE FUNCTION funcTemLivrosEditora(p_id_editora EDITORAS.id_editora%type) RETURN boolean AS
    l_n_livros int;
    l_editora_existe char(1);

    BEGIN
        SELECT 'y' into l_editora_existe
        FROM EDITORAS
        WHERE p_id_editora = ID_EDITORA;

        SELECT SUM(stock) INTO l_n_livros
        FROM EDICOES_LIVROS
        WHERE p_id_editora = id_editora;

        IF l_n_livros = 0 THEN
            RETURN false;
        end if;

        RETURN true;

    EXCEPTION
        WHEN OTHERS THEN
            RETURN null;
    end;

BEGIN
    if (funcTemLivrosEditora(1500) = false) then
        DBMS_OUTPUT.PUT_LINE('Editora não tem livros');
    elsif (funcTemLivrosEditora(1500) = true) then
        DBMS_OUTPUT.PUT_LINE('Editora tem livros');
    else
        DBMS_OUTPUT.PUT_LINE('Editora inválida');
    end if;
end;

BEGIN
    if (funcTemLivrosEditora(15) = false) then
        DBMS_OUTPUT.PUT_LINE('Editora não tem livros');
    elsif (funcTemLivrosEditora(15) = true) then
        DBMS_OUTPUT.PUT_LINE('Editora tem livros');
    else
        DBMS_OUTPUT.PUT_LINE('Editora inválida');
    end if;
end;