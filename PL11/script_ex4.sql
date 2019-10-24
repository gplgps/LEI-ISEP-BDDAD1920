CREATE OR REPLACE FUNCTION funcMenorIdadeClientes RETURN INTEGER AS
    l_menor_idade INTEGER;

    BEGIN
        SELECT MIN(TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_NASCIMENTO)/12)) INTO l_menor_idade
        FROM CLIENTES;

        RETURN l_menor_idade;
    end;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Menor idade: ' || funcMenorIdadeClientes());
end;