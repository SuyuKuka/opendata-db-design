-- Quelques requêtes que vous développerez pour vérifier que les dépendances fonctionnelles sont effectivement vérifiées dans les données. Concentrez vous sur les cas non-triviaux.
-- VARIETE -> ESPECE
SELECT variete_oucultivar, COUNT(DISTINCT espece) 
FROM Arbre
WHERE variete_oucultivar IS NOT NULL
GROUP BY variete_oucultivar
HAVING COUNT(DISTINCT espece) > 1;

-- ESPECE -> LIBELLE_FRANCAIS
SELECT espece, COUNT(DISTINCT libelle_francais) 
FROM Arbre
GROUP BY espece
HAVING COUNT(DISTINCT libelle_francais) > 1;

-- ADRESSE, COMPLEMENT, ARRONDISSEMENT -> DOMANIALITE
SELECT "LIEU / ADRESSE", "COMPLEMENT ADRESSE", arrondissement, COUNT(DISTINCT domanialite)
FROM Arbre
GROUP BY "LIEU / ADRESSE", "COMPLEMENT ADRESSE", arrondissement
HAVING COUNT(DISTINCT domanialite) > 1;



-- Une requête par jeu de données qui reproduit les données initiales à partir des projections
SELECT a.id_base, a.hauteur, a.circonference, a.stade_de_developpement, a.remarquable,
    e.libelle_francais, e.espece, g.genre, v.variete_oucultivar,
    emp.id_emplacement, emp.type_emplacement,
    COALESCE(gp.lieu, gp.adresse) AS lieu_adresse,
    COALESCE(NULLIF(gp.complement_adresse_adresse, ''), gp.complement_adresse_lieu) AS complement_adresse,
    COALESCE(adr.domanialite, L.domanialite) AS domanialite,
    gp.arrondissement, gp.geo_point_2d
FROM Arbre a
JOIN Espece e ON a.espece = e.espece
JOIN Genre g ON e.genre = g.genre
LEFT JOIN Variete v ON a.variete_oucultivar = v.variete_oucultivar
JOIN Emplacement emp ON a.id_emplacement = emp.id_emplacement
JOIN GeoPoint gp ON emp.geo_point_2d = gp.geo_point_2d
LEFT JOIN Adresse adr ON (
    gp.adresse = adr.adresse AND 
    gp.complement_adresse_adresse = adr.complement_adresse AND 
    gp.arrondissement = adr.arrondissement
)
LEFT JOIN Lieu l ON (
    gp.lieu = L.lieu AND 
    gp.complement_adresse_lieu = l.complement_adresse AND 
    gp.arrondissement = l.arrondissement
);