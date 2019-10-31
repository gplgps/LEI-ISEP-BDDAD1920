UPDATE vendas
SET DATA_HORA = TRUNC(data_hora) - REMAINDER(TO_NUMBER(TO_CHAR(data_hora, 'd')), 7) - 1
WHERE TO_NUMBER(TO_CHAR(data_hora, 'd')) IN (1, 7);

SELECT NR_VENDA, TO_CHAR(DATA_HORA, 'FMDAY')
FROM vendas;

ALTER TRIGGER trgVendasImpedirAlteracoesForaExpediente DISABLE;

UPDATE vendas
SET DATA_HORA = TRUNC(data_hora) - REMAINDER(TO_NUMBER(TO_CHAR(data_hora, 'd')), 7) - 1
WHERE TO_NUMBER(TO_CHAR(data_hora, 'd')) IN (1, 7);

SELECT NR_VENDA, TO_CHAR(DATA_HORA, 'FMDAY')
FROM vendas;

ALTER TRIGGER trgVendasImpedirAlteracoesForaExpediente ENABLE;
