CREATE OR REPLACE PROCEDURE procQtdVendasMensaisAnoEditora(p_idEditora IN Editoras.id_editora%type, p_ano IN INTEGER) AS

    l_nlivros_mes integer;
    exep_ano_invalido EXCEPTION;
    l_id_editora_test integer;


    CURSOR cur_qtd_vendida (
        c_id_editora IN Editoras.id_editora%TYPE,
        c_ano IN INTEGER,
        c_mes IN INTEGER)
        IS
        SELECT SUM(QUANTIDADE) INTO l_nlivros_mes
            FROM vendas v
            INNER JOIN EDICOES_LIVROS el ON v.ISBN = el.ISBN
            WHERE TO_NUMBER(TO_CHAR(v.DATA_HORA, 'MM')) = c_mes
                AND TO_NUMBER(TO_CHAR(v.DATA_HORA, 'YYYY')) = p_ano
                AND p_idEditora = el.ID_EDITORA;

    BEGIN
        SELECT ID_EDITORA INTO l_id_editora_test
            FROM EDITORAS
            WHERE ID_EDITORA = p_idEditora;

        IF p_ano >=EXTRACT(YEAR FROM SYSDATE) OR p_ano IS NULL THEN
            RAISE exep_ano_invalido;
        end if;

        dbms_output.put_line('Editora ' || p_idEditora);
        dbms_output.put_line('Vendas  ' || p_ano);
        dbms_output.put_line(' ');
        dbms_output.put_line('MÊS  QTD');
        dbms_output.put_line('----------');
        FOR c_mes IN 1..12
        LOOP
            OPEN cur_qtd_vendida(p_idEditora, p_ano, c_mes);
            FETCH cur_qtd_vendida INTO l_nlivros_mes;
            CLOSE cur_qtd_vendida;
            dbms_output.put_line(RPAD(TO_CHAR(c_mes), 5, ' ') || RPAD(TO_CHAR(NVL(l_nlivros_mes, 0)), 5, ' '));
        end loop;

EXCEPTION

    WHEN exep_ano_invalido THEN
        dbms_output.put_line('O ano é inválido.');
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Não existe essa editora, ou é inválida.');
    WHEN OTHERS THEN
        dbms_output.put_line('Erro inesperado');
    end;

begin
    procQtdVendasMensaisAnoEditora(1500, 2016);
end;

begin
    procQtdVendasMensaisAnoEditora(6543, 2016);
end;

begin
    procQtdVendasMensaisAnoEditora(1500, 2020);
end;

begin
    procQtdVendasMensaisAnoEditora(NULL, NULL);
end;