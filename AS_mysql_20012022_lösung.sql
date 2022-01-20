
CREATE TABLE T_Faecher (
    p_fach_id VARCHAR(256) NOT NULL,
    bezeichnung VARCHAR(256)
);

CREATE TABLE T_Schueler (
    p_schueler_nr INT NOT NULL,
    vorname VARCHAR(256),
    nachname VARCHAR(256)
);

CREATE TABLE T_Noten (
    p_note_nr INT NOT NULL AUTO_INCREMENT,
    notenwert INT CHECK (notenwert >= 1 AND notenwert <= 6),
    gewichtung INT,
    art VARCHAR(256),
    f_schueler_nr INT NOT NULL,
    f_fach_id VARCHAR(256) NOT NULL,
    PRIMARY KEY(p_note_nr)
);

ALTER TABLE T_Faecher ADD CONSTRAINT PK_Faecher PRIMARY KEY (p_fach_id);
ALTER TABLE T_Schueler ADD CONSTRAINT PK_Schueler PRIMARY KEY (p_schueler_nr);
ALTER TABLE T_Noten ADD CONSTRAINT FK_Noten_Schueler FOREIGN KEY (f_schueler_nr) REFERENCES T_Schueler (p_schueler_nr) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE T_Noten ADD CONSTRAINT FK_Noten_Faecher FOREIGN KEY (f_fach_id) REFERENCES T_Faecher (p_fach_id) ON DELETE NO ACTION ON UPDATE CASCADE;

INSERT INTO T_Faecher (p_fach_id, bezeichnung) VALUES ('deu', 'Deutsch');
INSERT INTO T_Faecher (p_fach_id, bezeichnung) VALUES ('mat', 'Mathe');
INSERT INTO T_Faecher (p_fach_id, bezeichnung) VALUES ('phy', 'Physik');

INSERT INTO T_Schueler (p_schueler_nr, vorname, nachname) VALUES (1, 'Manfred', 'Müller');
INSERT INTO T_Schueler (p_schueler_nr, vorname, nachname) VALUES (2, 'Heinz', 'Hansen');
INSERT INTO T_Schueler (p_schueler_nr, vorname, nachname) VALUES (3, 'Phillip', 'Pfläger');

INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (3.4, 10, '1. Test', 1, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.8, 10, '2. Test', 1, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.4, 25, '1. Klausur', 1, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.8, 25, '2. Klausur', 1, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.8, 30, 'Mitarbeit', 1, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (3.4, 10, '1. Test', 1, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (4.2, 10, '2. Test', 1, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (3.8, 10, '3. Test', 1, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.6, 20, 'Mitarbeit', 1, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (5.0, 25, '1. Klausur', 1, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (3.8, 25, '2. Klausur', 1, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.2, 10, '1. Test', 2, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.6, 10, '2. Test', 2, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.4, 25, '1. Klausur', 2, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.2, 25, '2. Klausur', 2, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.0, 30, 'Mitarbeit', 2, 'mat');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.4, 10, '1. Test', 2, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.2, 10, '2. Test', 2, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.8, 10, '3. Test', 2, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.6, 20, 'Mitarbeit', 2, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.0, 25, '1. Klausur', 2, 'phy');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.8, 25, '2. Klausur', 2, 'phy');