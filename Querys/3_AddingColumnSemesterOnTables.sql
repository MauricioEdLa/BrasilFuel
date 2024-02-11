DO $$
DECLARE 
    ano INT;
    semestre INT;
BEGIN
    FOR ano IN 2004..2023 LOOP
        FOR semestre IN 1..2 LOOP
            EXECUTE 'ALTER TABLE ca_' || LPAD(ano::TEXT, 4, '0') || '_' || LPAD(semestre::TEXT, 2, '0') || ' ADD COLUMN IF NOT EXISTS semester TEXT;';
        END LOOP;
    END LOOP;
END$$;