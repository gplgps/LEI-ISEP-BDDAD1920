CREATE OR REPLACE PROCEDURE procAutores AS
    i integer;

BEGIN
    i := 0;
    dbms_output.put_line('-  | ID   | NOME');
    dbms_output.put_line('--------------------------------------------');
    FOR c_autores IN (SELECT ID_AUTOR c_id_autor, NOME c_nome FROM AUTORES)
        LOOP
            BEGIN
                dbms_output.put_line(RPAD(TO_CHAR(i), 2, ' ') || ' | ' || RPAD(TO_CHAR(c_autores.c_id_autor), 4, ' ') || ' | ' ||RPAD(c_autores.c_nome, 35, ' '));
                i := i + 1;
            END;
        END LOOP;
end;

BEGIN
    procAutores();
end;