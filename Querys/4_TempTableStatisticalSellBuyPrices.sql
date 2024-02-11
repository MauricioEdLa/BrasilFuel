	-- Creating temp table for statistical data about buying and selling prices --
DO $$
DECLARE
    ano TEXT;
    semestre TEXT;
    sql_query TEXT;
BEGIN
    CREATE TEMP TABLE pricestatistics (
        semester TEXT,
        buying_data INT,
        avg_buying_price NUMERIC,
        minimum_buying_price NUMERIC,
        max_buying_price NUMERIC,
        selling_data INT,
        avg_selling_price NUMERIC,
        minimum_selling_price NUMERIC,
        max_selling_price NUMERIC
    );
    
    FOR ano IN 2004..2023 LOOP
        FOR semestre IN 1..2 LOOP
            sql_query := 'INSERT INTO pricestatistics
                            SELECT 
                                ''' || ano || '_' || semestre || ''' AS semester, 
                                COUNT(valordecompra) AS buying_data, 
                                AVG(valordecompra::NUMERIC) AS avg_buying_price, 
                                MIN(valordecompra) AS minimum_buying_price, 
                                MAX(valordecompra) AS max_buying_price,
                                COUNT(valordevenda) AS selling_data,
                                AVG(valordevenda::NUMERIC) AS avg_selling_price,
                                MIN(valordevenda) AS minimum_selling_price,
                                MAX(valordevenda) AS max_selling_price
                            FROM
                                ca_' || LPAD(ano::TEXT, 4, '0') || '_' || LPAD(semestre::TEXT, 2, '0');
            EXECUTE sql_query;
        END LOOP;
    END LOOP;
END$$;

	-- Query for checking results --
SELECT * FROM pricestatistics