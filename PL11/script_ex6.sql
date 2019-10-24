CREATE OR REPLACE FUNCTION funcClienteInfo(p_nif_cliente CLIENTES.nif_cliente%type) RETURN CLIENTES%rowtype AS
    l_info_clientes CLIENTES%rowtype;

    BEGIN
        SELECT * INTO l_info_clientes
        FROM CLIENTES
        WHERE NIF_CLIENTE = p_nif_cliente;

        RETURN l_info_clientes;

    EXCEPTION
        WHEN OTHERS THEN
            RETURN null;
    end;

BEGIN
    DBMS_OUTPUT.PUT_LINE('CLIENTE: '||funcClienteInfo(900800500).NOME);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(funcClienteInfo(900800500).NIF_CLIENTE));
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(funcClienteInfo(900800500).DATA_NASCIMENTO, 'DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE(funcClienteInfo(900800500).MORADA);
    DBMS_OUTPUT.PUT_LINE(funcClienteInfo(900800500).COD_POSTAL);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(funcClienteInfo(900800500).NR_TELEMOVEL));
end;

BEGIN
    DBMS_OUTPUT.PUT_LINE('CLIENTE: '||funcClienteInfo(0).NOME);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(funcClienteInfo(0).NIF_CLIENTE));
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(funcClienteInfo(0).DATA_NASCIMENTO, 'DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE(funcClienteInfo(0).MORADA);
    DBMS_OUTPUT.PUT_LINE(funcClienteInfo(0).COD_POSTAL);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(funcClienteInfo(0).NR_TELEMOVEL));
end;