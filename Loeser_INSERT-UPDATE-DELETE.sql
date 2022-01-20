--5.2.1
INSERT T_Schueler (p_schueler_nr, vorname, nachname) VALUES (4, 'Peter', 'Pank');

INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.6, 25, '1. Klausur', 4, 'deu');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.0, 25, '2. Klausur', 4, 'deu');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.8, 15, 'Test', 4, 'deu');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (2.4, 15, 'Referat', 4, 'deu');
INSERT INTO T_Noten (notenwert, gewichtung, art, f_schueler_nr, f_fach_id) VALUES (1.8, 20, 'Mitarbeit', 4, 'deu');

--5.2.2
UPDATE T_Noten SET notenwert = 4.0 WHERE f_schueler_nr = 1 AND f_fach_id = 'phy' AND art = '1. Klausur';

--5.2.3
DELETE FROM T_Noten WHERE f_schueler_nr = 2 AND f_fach_id = 'mat';