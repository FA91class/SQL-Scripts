SELECT t_schueler.vorname, t_schueler.nachname, t_noten.notenwert, t_noten.art, t_faecher.bezeichnung
FROM t_schueler
    INNER JOIN t_noten ON t_schueler.p_schueler_nr=t_noten.f_schueler_nr
    INNER JOIN t_faecher ON t_faecher.p_fach_id=t_noten.f_fach_id;

SELECT t_faecher.bezeichnung, COUNT(t_noten.p_note_nr) AS "Anzahl Noten"
FROM t_faecher
    INNER JOIN t_noten ON t_faecher.p_fach_id=t_noten.f_fach_id
GROUP BY t_faecher.bezeichnung;

SELECT t_schueler.vorname, t_schueler.nachname, (SUM(t_noten.notenwert) / COUNT(t_noten.notenwert)) AS "note", t_faecher.bezeichnung
FROM t_noten
    INNER JOIN t_schueler ON t_schueler.p_schueler_nr=t_noten.f_schueler_nr
    INNER JOIN t_faecher ON t_faecher.p_fach_id=t_noten.f_fach_id
GROUP BY t_schueler.vorname, t_schueler.nachname, t_faecher.bezeichnung;