-- QUANTIDADE DE DOMICÍLIOS E INDIVÍDUOS RESPONDENTES

SELECT ROUND(count(IDDOMICILIO), -3) as TOTAL_DOMICILIOS
FROM dbo.fato_domicilios;

SELECT ROUND(count(ID_DOMICILIO), -3) as TOTAL_INDIVIDUOS
FROM dbo.fato_individuos;



-- HOMOLOGAÇÃO CARD % DE CONECTADOS  (73%)

SELECT
c.quantidade as Qtde,
t.total as Total,
CEILING(c.quantidade / (t.Total +0.) * 100) as PERC_CONECTADOS 
FROM
(
SELECT
count(iddomicilio) as total
FROM dbo.fato_domicilios
) t,
(
SELECT
count(iddomicilio) as quantidade 
FROM dbo.fato_domicilios 
WHERE A4 = 1
)   c;


-- HOMOLOGAÇÃO CARD % com WiFI  (58%)

SELECT
c.quantidade as Qtde,
t.total as Total,
CEILING(c.quantidade / (t.Total +0.) * 100) as PERC_WIFI 
FROM
(
SELECT
count(iddomicilio) as total
FROM dbo.fato_domicilios
) t,
(
SELECT
count(iddomicilio) as quantidade 
FROM dbo.fato_domicilios 
WHERE A7A = 1
)   c

-- HOMOLOGAÇÃO CARD % Nunca usaram Internet (24%)

SELECT
c.quantidade as Qtde,
t.total as Total,
CEILING(c.quantidade / (t.Total +0.) * 100) as PERC_WIFI 
FROM
(
SELECT
count(id_domicilio) as total
FROM dbo.fato_individuos
) t,
(
SELECT
count(id_domicilio) as quantidade 
FROM dbo.fato_individuos 
WHERE C1 = 0
)   c


-- HOMOLOGAÇÃO CARD % Domicílios sem PC (77%)
SELECT
c.quantidade as Qtde,
t.total as Total,
CEILING(c.quantidade / (t.Total +0.) * 100) as PERC_WIFI 
FROM
(
SELECT
count(iddomicilio) as total
FROM dbo.fato_domicilios
) t,
(
SELECT
count(iddomicilio) as quantidade 
FROM dbo.fato_domicilios 
WHERE A1_A = 0 AND [A1_B] = 0
)   c


-- HOMOLOGAÇÃO CARD % Indivíduos que compraram pela internet (26%)
SELECT
c.quantidade as Qtde,
t.total as Total,
CEILING(c.quantidade / (t.Total +0.) * 100) as PERC_WIFI 
FROM
(
SELECT
count(id_domicilio) as total
FROM dbo.fato_individuos
) t,
(
SELECT
count(id_domicilio) as quantidade 
FROM dbo.fato_individuos 
WHERE H2 = 1
)   c



