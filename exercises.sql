/*AE-DB 3.1 "Einfache SELECT-Abfragen"*/

/*(1) Lassen Sie sich alle Personendaten anzeigen.*/
SELECT * FROM person;

/*(2) Lassen Sie sich in der angegebenen Reihenfolge den Vornamen, den Nachnamen, das Geburtsdatum und den Wohnort aller Personen anzeigen.*/
SELECT vorname, nachname, geburtsdatum, ort FROM person;

/*(3) Lassen Sie sich alle Wohnorte anzeigen. Unterdrücken Sie dabei die Mehrfachan-zeige identischer Landesangaben.*/
SELECT distinct ort FROM person;

/*(4) Lassen Sie sich in der angegebenen Reihenfolge den Vornamen, den Nachnamen, die Postleitzahl und den Wohnort aller Personen ausgeben. Sortieren Sie Nach-name und Vorname in alphabetischer Reihenfolge.*/
SELECT vorname, nachname, plz, ort FROM person ORDER BY nachname;
SELECT vorname, nachname, plz, ort FROM person ORDER BY vorname;

/*(5) Lassen Sie sich in der angegebenen Reihenfolge den Nachnamen, den Wohnort, PLZ sowie das Land aller Personen anzeigen. Verwenden Sie in der Ergebnistab-elle den Spaltennamen: Name, Land, Wohnort und Postleitzahl.*/
SELECT nachname as Name, land as Land, ort as Wohnort, plz as Postleitzahl FROM person;


/* Übung 3.2 (einfache Funktionen)*/

/*(1) Lassen Sie sich alle Artikeldaten anzeigen.*/
SELECT * FROM artikel;

/*(2) Lassen Sie sich alle Artikelnamen, die dazugehörigen Preise (Netto) und die Preise mit einem Aufschlag von 19% (Brutto) anzeigen. Benennen Sie in der Aus-gabe die entsprechenden Tabellenspalten Artikel, Nettopreis und Bruttopreis.*/
SELECT artikelname AS Artikelname, preis + (preis * 0.19) AS Brutto, preis as Netto FROM artikel;

/*(3) Welche Bestellsumme pro Artikel entsteht, wenn Sie von jedem Artikel 50 Stück bestellen. Lassen Sie sich Artikelname, Einzelpreis und Gesamtpreis anzeigen. Benennen Sie die entsprechenden Tabellenspalten Artikel, Einzelpreis, Gesamt-preis.*/
SELECT artikelname AS Artikel, preis AS Einzelpreis, preis * 50 as Gesamtpreis FROM artikel;

/* Übung 3.3 (logische Operatoren) */

/*(1) Lassen Sie sich die Personendaten aller Personen anzeigen, die in Berlin wohnen.*/
SELECT * FROM person WHERE ort = 'Berlin';

/*(2) Lassen Sie sich die Vornamen, Nachnamen und Wohnorte aller Personen anzeigen, die entweder in Berlin oder in Klagenfurt wohnen.*/
SELECT vorname AS Vorname, nachname AS Nachname, ort AS Wohnort FROM person WHERE ort = 'Berlin' OR ort = 'Klagenfurt';

/*(3) Lassen Sie sich die Vornamen, Nachnamen und Wohnorte aller Personen anzeigen, die nicht in Berlin wohnen.*/
SELECT vorname, nachname, ort FROM person WHERE not ort = 'Berlin';

/*(4) Lassen Sie sich die Nachnamen, Wohnorte und Geburtsdaten aller Personen anzeigen, die in Deutschland wohnen und nach dem 01.06.1960 geboren worden sind.*/
SELECT nachname, ort, geburtsdatum FROM person WHERE land LIKE('Deutschland') AND geburtsdatum > DATE'1960-06-01';

/* 3.4 (mathematische Funktionen) */

/*(1) Lassen Sie sich von allen Artikeln, die mehr als 300 kosten, den Artikelnamen, den Preis und einen um 20 % erhöhten Preis ausgeben. Runden Sie den berechneten Preis auf zwei Nachkommastellen. Nennen Sie die Tabellenspalten der Er-gebnistabelle Artikel, Nettopreis und Neupreis.*/
SELECT artikelname AS Artikel, preis as Nettopreis, ROUND(preis + (preis * 0.20),2) AS Neupreis FROM artikel WHERE preis > 300;

/*(2) Ermitteln Sie den durchschnittlichen Preis von Tastatur, Drucker und Festplatte. Nennen Sie die Tabellenspalte der Ergebnistabelle Durchschnittspreis.*/
SELECT AVG(preis) AS Durchschnittspreis FROM artikel WHERE artikelname IN('Tastatur', 'Drucker', 'Festplatte');

/*(3) Ermitteln Sie die Anzahl aller Artikel, die vom Hersteller mit der Herstellernummer 10 angeboten werden. Nennen Sie die Tabellenspalte der Ergebnistabelle Artikel-anzahl.*/
SELECT COUNT(artikelname) AS Artikelanzahl FROM artikel WHERE herstellernummer = '10';

/*(4) Ermitteln Sie den Gesamtpreis, wenn Sie jeweils 5 Artikel des Herstellers mit der Herstellernummer 10 kaufen würden. Nennen Sie die Tabellenspalte der Ergeb-nistabelle Gesamtpreis.*/
SELECT preis * 5 AS Gesamtpreis FROM artikel WHERE herstellernummer = '10';

/*(5) Ermitteln Sie den billigsten und den teuersten Artikel. Nennen Sie die Tabellen-spalten der Ergebnistabelle Billig und Teuer.*/
SELECT artikelname FROM artikel WHERE preis=(SELECT MIN(preis) FROM artikel) OR preis=(SELECT MAX(preis) FROM artikel);
/* OR */
SELECT artikelname FROM artikel WHERE preis LIKE(SELECT MIN(preis) FROM artikel) OR preis LIKE(SELECT MAX(preis) FROM artikel);

/*Übung 3.5.1 (Zeichenkettenvergleiche)*/

/*Führen Sie folgende Abfragen mit der Tabelle 'artikel' aus. Verwenden Sie für die Abfragen die Operatoren IN, BETWEEN und LIKE.*/

/*(1) Lassen Sie sich bis auf die Artikelnummer alle Artikeldaten der Hersteller mit der Herstellernummer 10, 30 und 50 anzeigen.*/
SELECT artikelnummer FROM artikel WHERE herstellernummer IN(10,30,50);

/*(2) Lassen Sie sich alle Artikelnamen und die dazugehörigen Artikelpreise ausgeben, die zwischen 200 und 400 liegen.*/
SELECT artikelname FROM artikel WHERE preis BETWEEN 200 AND 400;

/*(3) Lassen Sie sich alle Artikelnamen und dazugehörigen Artikelpreise ausgeben, de-ren Name mit dem Buchstaben M beginnt.*/
SELECT artikelname, preis FROM artikel WHERE artikelname LIKE('M%');

/*Übung 3.5.2*/

/*Führen Sie folgende Abfragen mit der Tabelle 'hersteller' aus.*/

/*(1) Lassen Sie sich die europäischen Herstellernamen und die dazugehörigen Länder anzeigen.*/
SELECT herstellername, land FROM hersteller WHERE land IN('Deutschland', 'Schweiz');

/*(2) Lassen Sie sich alle Herstellernamen und die dazugehörigen Länder anzeigen, die Hersteller beginnen mit dem Buchstaben M und sind nicht aus Japan sind.*/
SELECT herstellername, land FROM hersteller WHERE herstellername LIKE('M%') AND land not LIKE('Japan');

/*(3) Lassen Sie sich alle Herstellernamen und die dazugehörigen Länder anzeigen, die nicht mit dem Buchstaben M beginnen und entweder aus Deutschland oder den USA sind.*/
SELECT herstellername, land FROM hersteller WHERE herstellername not LIKE('M%') AND (land LIKE('Deutschland') OR land LIKE('USA'));

/*Übung 3.6.1 (Zeichenketten- und Datumsfunktionen)*/

/*In dieser Aufgabe sollen Sie die Anwendung von Zeichenketten- und Datumsfunktionen üben. Führen Sie dazu folgende Abfragen mit der Tabelle 'person' aus: */

/*(1) Geben Sie in jeweils einer Spalte einer Ergebnistabelle den Namen einer Person bestehend aus Vornamen und Nachnamen sowie die Anschrift bestehend aus Postleitzahl und Ort aus. Fügen Sie in der Ausgabe zwischen Vornamen und Nachnamen sowie zwischen Postleitzahl und Ort ein Leerzeichen ein. Nennen Sie die Spalten der Ergebnistabelle Name und Anschrift.*/
SELECT CONCAT_WS(' ',vorname, nachname) AS Name, CONCAT_WS(' ',plz, ort) AS Anschrift FROM person;

/*(2) Ermitteln Sie die Länge aller Ortsnamen und geben Sie Ortsnamen und Länge in einer Ergebnistabelle aus. Nennen Sie die Spalten der Ergebnistabelle «Orts-name» und «Ortsnamenlänge». Unterdrücken Sie die Mehrfachanzeige identischer Ortsangaben.*/
SELECT distinct ort AS  Ortsname, LENGTH(ort) AS Ortsnamenlänge FROM person;

/*(3) Ermitteln Sie das Alter aller Personen der Tabelle 'person'. Lassen Sie sich das Al-ter, den Vornamen, den Nachnamen und das Geburtsdatum jeder Person anzei-gen. Nennen Sie die Spalte der Ergebnistabelle, die die Altersangaben enthält, Le-bensalter. */

SELECT geburtsdatum AS Geburtsdatum, vorname AS Vorname, nachname AS Nachname, TIMESTAMPDIFF(YEAR, geburtsdatum, CURDATE()) AS Lebensalter FROM person;

/*Übung 3.7.1 (Gruppieren von Datenmengen)*/

/*Ermitteln Sie aus allen Bestellungen der Tabelle 'bestellung' die Anzahl der Bestellungen für jeden Artikel und die daraus resultierende Gesamtbestellsumme pro Artikel. Berück-sichtigen Sie dabei nur Gesamtbestellsummen, die größer als 200 sind. Lassen Sie sich die Artikelnummer, die Anzahl der Bestellungen eines Artikels sowie die Gesamtbestell-summe anzeigen. Nennen Sie die Spalten der Ergebnistabelle Artikelnummer, Artikelan-zahl und Gesamtbestellsumme. Benutzen Sie eine Gruppierung.*/
SELECT bestellung.artikelanzahl, bestellung.bestellsumme, bestellung.artikelnummer 
FROM bestellung 
INNER JOIN artikel ON artikel.artikelnummer = bestellung.artikelnummer
WHERE bestellung.bestellsumme > 200
GROUP BY artikel.artikelnummer;

/*Übung 3.7.2*/

/*Ermitteln Sie aus allen Artikeln der Tabelle 'artikel' den Durchschnittspreis aller Artikel eines Herstellers. Berücksichtigen Sie dabei nur die Hersteller, die mehrere Artikel an-bieten. Lassen Sie sich die Herstellernummer und den Durchschnittspreis anzeigen. Nen-nen Sie die Spalten der Ergebnistabelle Herstellernummer und Durchschnittspreis. Be-nutzen sie eine Gruppierung.*/
SELECT hersteller.herstellername AS Herstellername, artikel.artikelname AS Artikelname, AVG(artikel.preis) AS Durchschnittspreis
FROM artikel INNER JOIN hersteller ON artikel.herstellernummer = hersteller.herstellernummer
GROUP BY hersteller.herstellername
HAVING COUNT(artikel.artikelname) > 1

/*Übung 3.8.1*/

/*Führen Sie die Abfragen mit den Tabellen 'artikel' und 'hersteller' durch.*/

/*(1) Lassen Sie sich alle Artikelnamen und alle dazugehörigen Informationen über den Artikelhersteller, sortiert nach Artikelnamen, anzeigen. Benutzen Sie zur Tabellen-verknüpfung die WHERE-Klausel. Benutzen Sie außerdem den Aliasnamen a für die Tabelle 'artikel' und den Aliasnamen h für die Tabelle 'hersteller'.*/
SELECT a.artikelname, h.herstellername, h.herstellernummer, h.land
FROM artikel AS a, hersteller AS h
WHERE a.herstellernummer = h.herstellernummer 
GROUP BY a.artikelname

/*(2) Lassen Sie sich alle Namen, Preise und die zugehörigen Hersteller für Artikel anzeigen, deren Preis höher als 200 ist. Nutzen Sie für die Tabellenverknüpfung die JOIN-Klausel. Benutzen Sie außerdem den Aliasnamen a für die Tabelle 'artikel' und den Aliasnamen h für die Tabelle 'hersteller'.*/
SELECT a.artikelname, a.preis, h.herstellername
FROM artikel AS a
INNER JOIN hersteller AS h ON a.herstellernummer = h.herstellernummer
WHERE a.preis > 200

/*Übung 3.8.2*/

/*Führen Sie die Abfragen mit den Tabellen 'person', 'artikel', 'hersteller' und 'bestellung' durch.*/

/*(1) Lassen Sie sich zu jedem Bestellvorgang in der angegebenen Reihenfolge folgende Daten anzeigen: Bestellnummer, Nachname und Vorname des Kunden, Ar-tikelanzahl und Bestellsumme.*/
SELECT b.bestellnummer, p.vorname, p.nachname, b.artikelanzahl, b.bestellsumme
FROM bestellung as b 
	INNER JOIN artikel AS a 
        ON b.artikelnummer = a.artikelnummer
    INNER JOIN person AS p 
        ON b.kundennummer = p.personennummer
    INNER JOIN hersteller AS h 
        ON a.herstellernummer = h.herstellernummer

/*(2) Welche Kunden haben mehr als 2 Artikel bestellt? Lassen Sie sich die Bestellnummer, Vor- und Nachname des Kunden, Artikelname, Artikelanzahl und Artikelpreis anzeigen.*/
SELECT b.bestellnummer, p.vorname, p.nachname, a.artikelname, a.artikelnummer, b.artikelanzahl
FROM bestellung AS b
INNER JOIN artikel AS a ON a.artikelnummer = b.artikelnummer
INNER JOIN person AS p ON p.personennummer = b.kundennummer
WHERE b.artikelanzahl > 2

/*(3) Welche Kunden haben Artikel bestellt, die in Japan hergestellt werden? Lassen Sie sich Nachname und Vorname des Kunden, Artikelname, Herstellername sowie das Herstellerland anzeigen.*/
SELECT p.vorname, p.nachname, a.artikelname, h.land
FROM bestellung AS b
INNER JOIN artikel AS a ON a.artikelnummer = b.artikelnummer
INNER JOIN person AS p ON p.personennummer = b.kundennummer
INNER JOIN hersteller AS h ON h.herstellernummer = a.herstellernummer
WHERE h.land = 'Japan'

/*(4) Überprüfen Sie, ob Kunden aus Forssa Geräte von einem Hersteller aus Japan bestellt haben. Lassen Sie sich Nachname, Vorname und Wohnort des Kunden, den Artikelnamen sowie das Herstellerland anzeigen.*/
SELECT p.vorname, p.nachname, p.ort, a.artikelname, h.land
FROM bestellung AS b
INNER JOIN artikel AS a ON a.artikelnummer = b.artikelnummer
INNER JOIN person AS p ON p.personennummer = b.kundennummer
INNER JOIN hersteller AS h ON h.herstellernummer = a.herstellernummer
WHERE h.land = 'Japan' AND p.ort = 'Forssa'

/*(5) Lassen Sie sich die vollständigen Daten aller Kunden anzeigen, die einen Artikel vom Hersteller Logitech bestellt haben. Lassen Sie sich Nachname, Vorname und Geburtsdatum des Kunden sowie Wohnort und Postleitzahl anzeigen.*/
SELECT p.vorname, p.nachname, p.geburtsdatum, p.ort, p.plz 
FROM bestellung AS b
INNER JOIN artikel AS a ON a.artikelnummer = b.artikelnummer
INNER JOIN person AS p ON p.personennummer = b.kundennummer
INNER JOIN hersteller AS h ON h.herstellernummer = a.herstellernummer
WHERE h.herstellername = 'Logitech';

/*Übung 3.8.3*/

/*Führen Sie folgende Abfragen mithilfe von Unterabfragen aus.*/

/*(1) Ermitteln Sie aus der Tabelle 'person' den Nachnamen und das Geburtsdatum der jüngsten Person. Nennen Sie die Spalten der Ergebnistabelle Name und Geburtsdatum.*/
SELECT vorname, nachname, geburtsdatum
FROM person 
WHERE geburtsdatum = (SELECT MAX(geburtsdatum) FROM person)

/*(2) Ermitteln Sie aus der Tabelle 'artikel' den Namen und den Preis des billigsten Artikels. Nennen Sie die Spalten der Ergebnistabelle Artikel und Preis.*/
SELECT artikelname AS Artikelname, preis AS Preis
FROM artikel
WHERE preis = (SELECT MIN(preis) FROM artikel)

/*(3) Ermitteln Sie mithilfe der Tabellen 'bestellung', 'artikel' und 'person' die Bestel-lung mit der höchsten Bestellsumme. Lassen Sie sich den dazugehörigen Nachna-men des Kunden, den Artikelnamen und die Bestellsumme anzeigen. Nennen Sie die Spalten der Ergebnistabelle Name, Artikel und Bestellsumme.*/

SELECT p.vorname AS Name, a.artikelname AS Artikel, b.bestellsumme AS Bestellsumme
FROM bestellung AS b
INNER JOIN artikel AS a ON a.artikelnummer = b.artikelnummer
INNER JOIN person AS p ON p.personennummer = b.kundennummer
WHERE b.bestellsumme = (SELECT MAX(bestellung.bestellsumme) FROM bestellung)