CREATE OR REPLACE PROCEDURE procAutores AS
    l_id_autor integer;
    l_nome_autor VARCHAR(35);

    CURSOR c_id_autor IS
        SELECT ID_AUTOR
        FROM AUTORES;

BEGIN
    dbms_output.put_line('ID   | NOME');
    dbms_output.put_line('--------------------------------------------');
    OPEN c_id_autor;
        LOOP
            FETCH c_id_autor INTO l_id_autor;
            EXIT WHEN c_id_autor%notfound;
            SELECT nome INTO l_nome_autor
            FROM AUTORES WHERE l_id_autor = ID_AUTOR;

            dbms_output.put_line(RPAD(TO_CHAR(l_id_autor), 4, ' ') || ' | ' ||RPAD(l_nome_autor, 35, ' '));

        END LOOP;
    CLOSE c_id_autor;

end;

BEGIN
    procAutores();
end;