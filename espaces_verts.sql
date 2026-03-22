DROP TABLE IF EXISTS geo CASCADE;
DROP TABLE IF EXISTS adresses CASCADE;
DROP TABLE IF EXISTS equipements CASCADE;
DROP TABLE IF EXISTS espaces_verts CASCADE;

CREATE TABLE geo (
    geom_x_y TEXT PRIMARY KEY,
    geom TEXT NOT NULL,
    url_plan TEXT
);

CREATE TABLE adresses (
    adresse_numero INTEGER,
    adresse_typevoie TEXT,
    adresse_libellevoie TEXT,
    adresse_codepostal TEXT NOT NULL,
    PRIMARY KEY (adresse_numero, adresse_typevoie, adresse_libellevoie)
);

CREATE TABLE equipements (
    id_eqpt TEXT PRIMARY KEY,
    id_division INTEGER NOT NULL
);

CREATE TABLE espaces_verts (
    nsq_espace_vert INTEGER PRIMARY KEY,
    nom_ev TEXT,
    type_ev TEXT,
    categorie TEXT,
    adresse_numero INTEGER,
    adresse_complement TEXT,
    adresse_typevoie TEXT,
    adresse_libellevoie TEXT,
    poly_area INTEGER,
    surface_totale_reelle INTEGER,
    surface_horticole INTEGER,
    presence_cloture TEXT,
    perimeter NUMERIC,
    annee_ouverture INTEGER,
    annee_renovation INTEGER,
    ancien_nom_ev TEXT,
    annee_changement_nom INTEGER,
    nb_entites INTEGER,
    ouvert_ferme TEXT,
    id_atelier_horticole INTEGER,
    ida3d_enb TEXT,
    site_villes TEXT,
    id_eqpt TEXT,
    competence TEXT,
    geom_x_y TEXT,
    last_edited_user TEXT,
    last_edited_date TIMESTAMP,
    FOREIGN KEY (geom_x_y) REFERENCES geo(geom_x_y),
    FOREIGN KEY (id_eqpt) REFERENCES equipements(id_eqpt),
    FOREIGN KEY (adresse_numero, adresse_typevoie, adresse_libellevoie) REFERENCES adresses(adresse_numero, adresse_typevoie, adresse_libellevoie),
    CHECK (poly_area >= 0),
    CHECK (surface_totale_reelle >= 0),
    CHECK (surface_horticole >= 0),
    CHECK (perimeter >= 0),
    CHECK (presence_cloture IN ('Oui', 'Non') OR presence_cloture IS NULL),
    CHECK (ouvert_ferme IN ('Oui', 'Non') OR ouvert_ferme IS NULL)
);

--CHEN Michel
--HUYNH Minh Van Claude