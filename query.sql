-- id_eqpt -> id_division
SELECT id_eqpt, COUNT(DISTINCT id_division)
FROM espaces_verts
WHERE id_eqpt <> '0'        -- Il n y avait qu'un XXXX mais peut être qu'on pourrait vérifier les chaines de X avec un like
GROUP BY id_eqpt
HAVING COUNT(DISTINCT id_division) > 1;

-- geom_x_y -> geom
SELECT geom_x_y, COUNT(DISTINCT geom) AS nb_geom
FROM espaces_verts
GROUP BY geom_x_y
HAVING COUNT(DISTINCT geom) > 1;

-- geom_x_y -> URL_PLAN
SELECT geom_x_y, COUNT(DISTINCT URL_PLAN) AS nb_url
FROM espaces_verts
GROUP BY geom_x_y
HAVING COUNT(DISTINCT URL_PLAN) > 1;

-- Verification que geom_x_y n est jamais NULL
SELECT COUNT(*) AS geom_x_y_null
FROM espaces_verts
WHERE geom_x_y IS NULL;


-- Test pour savoir si nsq_espace_vert est clé primaire
SELECT COUNT(nsq_espace_vert)
FROM espaces_verts
GROUP BY nsq_espace_vert
HAVING COUNT(DISTINCT nsq_espace_vert) > 1;

-- Donne 8 NULL
SELECT COUNT(*)
FROM espaces_verts
WHERE nsq_espace_vert IS NULL;

-- CHEN Michel
-- HUYNH Minh Van Claude