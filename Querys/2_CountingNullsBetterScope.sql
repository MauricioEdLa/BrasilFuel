CREATE OR REPLACE PROCEDURE checknulls (tableyear TEXT)
LANGUAGE plpgsql
AS $$
BEGIN

SELECT
	COUNT(*) FILTER (WHERE regiao IS null) AS regiao_null,
	COUNT(*) FILTER (WHERE estado IS null) AS estado_null,
	COUNT(*) FILTER (WHERE municipio IS null) AS municipio_null,
	COUNT(*) FILTER (WHERE revenda IS null) AS revenda_null,
	COUNT(*) FILTER (WHERE cnpj IS null) AS cnpj_null,
	COUNT(*) FILTER (WHERE nomerua IS null) AS nomerua_null,
	COUNT(*) FILTER (WHERE numerorua IS null) AS numeroruanull,
	COUNT(*) FILTER (WHERE complemento IS null) AS complemento_null,
	COUNT(*) FILTER (WHERE bairro IS null) AS bairro_null,
	COUNT(*) FILTER (WHERE cep IS null) AS cep_null,
	COUNT(*) FILTER (WHERE produto IS null) AS produto_null,
	COUNT(*) FILTER (WHERE datadacoleta IS null) AS datadacoleta_null,
	COUNT(*) FILTER (WHERE valordevenda IS null) AS valordevenda_null,
	COUNT(*) FILTER (WHERE valordecompra IS null) AS valordecompra_null,
	COUNT(*) FILTER (WHERE unidadedemedida IS null) AS unidadedemedida_null,
	COUNT(*) FILTER (WHERE bandeira IS null) AS bandeira_null
FROM tableyear;

END; 
$$;

CALL checknulls(ca_2004_01);