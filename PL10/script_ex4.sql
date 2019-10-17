--EXERCÍCIO 4--
--Criação do procedimento--

CREATE OR REPLACE PROCEDURE procQtdEdicoesLivrosEditora(p_editora IN Editoras.ID_EDITORA%type) AS
    l_nLivros integer;
    l_editora_valida integer;

BEGIN
    SELECT COUNT(*) INTO l_editora_valida
    FROM EDITORAS WHERE EDITORAS.ID_EDITORA = p_editora;

    IF (l_editora_valida != 0) THEN

            SELECT COUNT(*) INTO l_nLivros
            FROM EDICOES_LIVROS el
                INNER JOIN EDITORAS e ON e.ID_EDITORA = el.ID_EDITORA
            WHERE e.ID_EDITORA = p_editora;

           dbms_output.put_line('Editora: ' || p_editora);
           dbms_output.put_line('Número de edições de livros: ' || l_nLivros);

    ELSE
        dbms_output.put_line('Editora' || NVL(' ' || TO_CHAR(p_editora) || ' ', ' ') || 'não existe');
    end if;
end;

--TESTES--

--passa (retorna 3)--
BEGIN
    procQtdEdicoesLivrosEditora(1800);
END;

--retorna como não existente--
BEGIN
    procQtdEdicoesLivrosEditora(6000);
END;
--retorna como não existente--
BEGIN
    procQtdEdicoesLivrosEditora(null);
END;