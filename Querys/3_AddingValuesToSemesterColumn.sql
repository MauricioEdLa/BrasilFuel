DO $$
DECLARE
	ano INT;
	semestre INT;
BEGIN
	FOR ano IN 2004..2023 LOOP
		FOR semestre IN 1..2 LOOP
			EXECUTE 'UPDATE ca_' || LPAD(ano::TEXT, 4, '0') || '_' || LPAD(semestre::TEXT, 2, '0') ||
					' SET semester = ' || LPAD(ano::TEXT, 4, '0') || '_' || LPAD(semestre::TEXT, 2, '0') || ';';
		END LOOP;
	END LOOP;
END$$;