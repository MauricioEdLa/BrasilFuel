DO $$
DECLARE
    ano TEXT;
    semestre TEXT;
    sqlquery TEXT;
BEGIN
    CREATE TEMP TABLE pricebyfuel (
        semester TEXT,
        product TEXT,
        avgprice NUMERIC
    );
    FOR ano IN 2004..2023 LOOP
        FOR semestre IN 1..2 LOOP
            sqlquery := 'INSERT INTO pricebyfuel
                            SELECT 
                                ''' || ano || '_' || semestre || ''' AS semester,
                                produto AS product,
                                (SELECT AVG(valordevenda::NUMERIC) 
                                 FROM ca_' || LPAD(ano::TEXT, 4, '0') || '_' || LPAD(semestre::TEXT, 2, '0') || ' 
                                 WHERE produto = t.produto) AS avgprice
                            FROM
                                (SELECT DISTINCT produto FROM ca_' || LPAD(ano::TEXT, 4, '0') || '_' || LPAD(semestre::TEXT, 2, '0') || ') AS t';
            EXECUTE sqlquery;
        END LOOP;
    END LOOP;
END$$;

SELECT * 
FROM pricebyfuel;