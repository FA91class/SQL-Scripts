#5.1.1
SELECT s.vorname, s.nachname, n.notenwert, n.art, f.bezeichnung
FROM
	T_Schueler AS s
		INNER JOIN
	T_Noten AS n ON (s.p_schueler_nr = n.f_schueler_nr)
		INNER JOIN
	T_Faecher AS f ON (n.f_fach_id = f.p_fach_id)
WHERE s.vorname = 'Manfred' AND s.nachname = 'Müller' AND n.art LIKE '%Klausur';

#5.1.2
SELECT f.bezeichnung, COUNT(*) AS "Anzahl Noten"
FROM
	T_Noten AS n
		INNER JOIN
	T_Faecher AS f ON (n.f_fach_id = f.p_fach_id)
GROUP BY f.bezeichnung;

#5.1.3
SELECT s.vorname, s.nachname, SUM(n.notenwert * n.gewichtung) / SUM(n.gewichtung) AS Zeugnisnote, f.bezeichnung AS Fach
FROM
	T_Schueler AS s
		INNER JOIN
	T_Noten AS n ON (s.p_schueler_nr = n.f_schueler_nr)
		INNER JOIN
	T_Faecher AS f ON (n.f_fach_id = f.p_fach_id)
GROUP BY s.vorname, s.nachname, f.bezeichnung;