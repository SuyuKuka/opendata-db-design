DROP TABLE IF EXISTS Genre CASCADE;
DROP TABLE IF EXISTS Adresse CASCADE;
DROP TABLE IF EXISTS Espece CASCADE;
DROP TABLE IF EXISTS GeoPoint CASCADE;
DROP TABLE IF EXISTS Variete CASCADE;
DROP TABLE IF EXISTS Emplacement CASCADE;
DROP TABLE IF EXISTS Arbre CASCADE;

CREATE TABLE Genre (
    genre TEXT PRIMARY KEY
);

CREATE TABLE Domaine (
    domanialite TEXT PRIMARY KEY
);

CREATE TABLE Espece (
    espece TEXT PRIMARY KEY,
    genre TEXT NOT NULL,
    libelle_francais TEXT NOT NULL,
    FOREIGN KEY (genre) REFERENCES Genre(genre)
);

CREATE TABLE Adresse (
    adresse TEXT NOT NULL,
    complement_adresse TEXT NOT NULL DEFAULT '', -- au lieu de mettre NULL on met la chaine vide
    arrondissement TEXT NOT NULL,
    domanialite TEXT NOT NULL,
    PRIMARY KEY (adresse, complement_adresse, arrondissement),
    FOREIGN KEY (domanialite) REFERENCES Domaine(domanialite)
);

CREATE TABLE Lieu (
    lieu TEXT NOT NULL,
    complement_adresse TEXT NOT NULL DEFAULT '',
    arrondissement TEXT NOT NULL,
    domanialite TEXT NOT NULL,
    PRIMARY KEY (lieu, complement_adresse, arrondissement),
    FOREIGN KEY (domanialite) REFERENCES Domaine(domanialite)
);

CREATE TABLE Variete (
    variete_oucultivar TEXT PRIMARY KEY,
    espece TEXT NOT NULL,
    FOREIGN KEY (espece) REFERENCES Espece(espece)
);

CREATE TABLE GeoPoint(
    geo_point_2d TEXT PRIMARY KEY, -- type geo_point_2d n'existe pas donc nous avons mis TEXT
    adresse TEXT,
    complement_adresse_adresse TEXT DEFAULT '',
    lieu TEXT,
    complement_adresse_lieu TEXT DEFAULT '',
    arrondissement TEXT,
    FOREIGN KEY (adresse, complement_adresse_adresse, arrondissement) REFERENCES Adresse(adresse, complement_adresse, arrondissement),
    FOREIGN KEY (lieu, complement_adresse_lieu, arrondissement) REFERENCES Lieu(lieu, complement_adresse, arrondissement),
    CHECK (adresse IS NOT NULL OR lieu IS NOT NULL)
);

CREATE TABLE Emplacement (
    id_emplacement INTEGER PRIMARY KEY,
    geo_point_2d TEXT NOT NULL,
    type_emplacement TEXT NOT NULL,
    FOREIGN KEY (geo_point_2d) REFERENCES GeoPoint(geo_point_2d)
);

CREATE TABLE Arbre (
    id_base INTEGER PRIMARY KEY,
    espece TEXT NOT NULL,
    variete_oucultivar TEXT,
    id_emplacement INTEGER NOT NULL,
    hauteur INTEGER NOT NULL,
    circonference INTEGER NOT NULL,
    stade_de_developpement TEXT NOT NULL,
    remarquable TEXT,
    FOREIGN KEY (espece) REFERENCES Espece(espece),
    FOREIGN KEY (variete_oucultivar) REFERENCES Variete(variete_oucultivar),
    FOREIGN KEY (id_emplacement) REFERENCES Emplacement(id_emplacement),
    CHECK (hauteur >= 0),
    CHECK (circonference >= 0),
    CHECK (remarquable IN ('OUI', 'NON', '') OR remarquable IS NULL)
);

--CHEN Michel
--HUYNH Minh Van Claude