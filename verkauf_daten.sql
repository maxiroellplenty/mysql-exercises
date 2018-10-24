INSERT INTO person VALUES
(1,"Blotzek","Ulrich","Großkopf 4","Arnsberg","59823","Deutschland","1960-10-05"),
(2,"Schatter","Peter","Försterstrasse 56","Augsburg","86179","Deutschland","1980-01-01"),
(3,"Wojack","Albert","Westendstrasse 92","Berlin","12234","Deutschland","1955-06-15"),
(4,"Virtanen","Veera","Oyi Keilasatama 21","Espoo","02150","Finnland","1992-12-30"), 
(5,"Hämäläinen","Ahvo","Tapulikuja 56","Forssa","30100","Finnland","1977-04-23"), 
(6,"Huisman","Fenna","Spoordreef 87","Almere","1315","Niederlande","1971-08-17"), 
(7,"Prins","Lieke","Noordgeest 21","Bergen op Zoom","4600","Niederlande","1987-05-08"), 
(8,"David","Paula","Murielstrasse 47","Klagenfurt","9020","Österreich","1970-01-21"), 
(9,"Hardiff","Joseph","Bischofstrasse 139","Klagenfurt","9200","Österreich","1962-08-09");

-- Die folgenden UPDATE-Anweisungen sind schon Lösungsvorschläge zum LJ-AE-DB-GR-2.4
-- UPDATE person SET plz = "9900", ort = "Lienz" WHERE personennummer = 9;

-- UPDATE person SET plz = "12557" WHERE personennummer = 3;

INSERT INTO hersteller VALUES
(10,'Logitech','Schweiz'),
(20,'SONY','Japan'),
(30,'Maxtor','USA'),
(40,'Medion','Deutschland'),
(50,'Hewlett Packard','USA');

INSERT INTO artikel VALUES
(1,10,'Maus',10.00),
(2,10,'Tastatur',20.00),
(3,50,'Drucker',300.00),
(4,30,'Festplatte',400.00),
(5,20,'Monitor',500.00);

INSERT INTO bestellung VALUES
(1,1,4,2,20.00),
(2,2,1,1,20.00),
(3,1,2,3,30.00),
(4,3,3,1,300.00),
(5,5,5,5,2500.00);
