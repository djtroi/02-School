--
-- Dieses Skript mit folgendem Befehl ausführen:
-- 
-- mysql -u root < verleger.sql

DROP DATABASE IF EXISTS verleger;

CREATE DATABASE verleger;

USE verleger;

SET NAMES utf8;


CREATE TABLE Tb_Autor
(
A_PKy VARCHAR(11) NOT NULL,
A_nname VARCHAR(40),
A_vname VARCHAR(20),
Telefonnr CHAR(12),
Strasse VARCHAR(40),
Ort VARCHAR(20),
Land CHAR(2),
PLZ CHAR(5),
Vertrag CHAR(1),
PRIMARY KEY (A_PKy),
UNIQUE UC_A_PKy (A_PKy)
);


CREATE TABLE Tb_Verleger
(
V_PKy CHAR(4) NOT NULL,
V_name VARCHAR(40),
Ort VARCHAR(20),
Land CHAR(2),
Staat VARCHAR(30),
PRIMARY KEY (V_PKy),
UNIQUE UC_V_PKy (V_PKy)
);


CREATE TABLE Tb_Buch
(
Buch_PKy VARCHAR(6) NOT NULL,
Titel VARCHAR(80),
Gebiet CHAR(12),
FKy_V CHAR(4) NOT NULL,
Preis NUMERIC(8,2),
Vorschuss NUMERIC(8,2),
Tantiemen INT,
Verkaeufe INT,
Bemerkungen VARCHAR(250),
Erscheinungsdatum DATE,
FOREIGN KEY (FKy_V) REFERENCES Tb_Verleger (V_PKy),
PRIMARY KEY (Buch_PKy),
UNIQUE UC_Buch_PKy (Buch_PKy)
);


CREATE TABLE Rel_BuchAutor
(
FKy_A VARCHAR(11) NOT NULL,
FKy_Buch VARCHAR(6) NOT NULL,
A_mit TINYINT,
Anteil INT,
FOREIGN KEY (FKy_A) REFERENCES Tb_Autor (A_PKy),
FOREIGN KEY (FKy_Buch) REFERENCES Tb_Buch (Buch_PKy)
);




CREATE TABLE Tb_V_info
(
FKy_V CHAR(4) NOT NULL,
Logo CHAR(20),
Pr_info TEXT,
FOREIGN KEY (FKy_V) REFERENCES Tb_Verleger (V_PKy)
);


CREATE TABLE Tb_Buchhandlung
(
B_PKy CHAR(4) NOT NULL,
Name VARCHAR(40),
Strasse VARCHAR(40),
Ort VARCHAR(20),
Land CHAR(2),
PLZ CHAR(5),
PRIMARY KEY (B_PKy),
UNIQUE UC_B_PKy (B_PKy)
);


CREATE TABLE Tb_Auftrag
(
FKy_B CHAR(4) NOT NULL,
Auftragsnr VARCHAR(20),
Datum DATE,
Menge SMALLINT,
Zahlungsbed VARCHAR(12),
FKy_Buch VARCHAR(6) NOT NULL,
FOREIGN KEY (FKy_B) REFERENCES Tb_Buchhandlung (B_PKy),
FOREIGN KEY (FKy_Buch) REFERENCES Tb_Buch (Buch_PKy)
);


CREATE TABLE Tb_Tantiemen
(
FKy_Buch VARCHAR(6) NOT NULL,
U_bereich INT,
O_bereich INT,
Tantiemen INT,
FOREIGN KEY (FKy_Buch) REFERENCES Tb_Buch (Buch_PKy)
);


CREATE TABLE Tb_Rabatt
(
Rabattart VARCHAR(40),
FKy_B CHAR(4),
Mindestmenge SMALLINT,
Hoechstmenge SMALLINT,
Rabatt DECIMAL(5,2),
FOREIGN KEY (FKy_B) REFERENCES Tb_Buchhandlung (B_PKy)
);



# Datensätze einfügen
INSERT Tb_Autor VALUES('409-56-7008', 'Bennet', 'Abraham', '415 658-9932', '6223 Bateman St.', 'Berkeley', 'CA', '94705', 1);
INSERT Tb_Autor VALUES('213-46-8915', 'Green', 'Marjorie', '415 986-7020', '309 63rd St. #411', 'Oakland', 'CA', '94618', 1);
INSERT Tb_Autor VALUES('238-95-7766', 'Carson', 'Cheryl', '415 548-7723', '589 Darwin Ln.', 'Berkeley', 'CA', '94705', 1);
INSERT Tb_Autor VALUES('998-72-3567', 'Ringer', 'Albert', '801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
INSERT Tb_Autor VALUES('899-46-2035', 'Ringer', 'Anne', '801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
INSERT Tb_Autor VALUES('722-51-5454', 'DeFrance', 'Michel', '219 547-9982', '3 Balding Pl.', 'Gary', 'IN', '46403', 1);
INSERT Tb_Autor VALUES('807-91-6654', 'Panteley', 'Sylvia', '301 946-8853', '1956 Arlington Pl.', 'Rockville', 'MD', '20853', 1);
INSERT Tb_Autor VALUES('893-72-1158', 'McBadden', 'Heather', '707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688', 0);
INSERT Tb_Autor VALUES('724-08-9931', 'Stringer', 'Dirk', '415 843-2991', '5420 Telegraph Av.', 'Oakland', 'CA', '94609', 0);
INSERT Tb_Autor VALUES('274-80-9391', 'Straight', 'Dean', '415 834-2919', '5420 College Av.', 'Oakland', 'CA', '94609', 1);
INSERT Tb_Autor VALUES('756-30-7391', 'Karsen', 'Livia', '415 534-9219', '5720 McAuley St.', 'Oakland', 'CA', '94609', 1);
INSERT Tb_Autor VALUES('724-80-9391', 'MacFeather', 'Stearns', '415 354-7128', '44 Upland Hts.', 'Oakland', 'CA', '94612', 1);
INSERT Tb_Autor VALUES('427-17-2319', 'Dull', 'Ann', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
INSERT Tb_Autor VALUES('672-71-3249', 'Yokomoto', 'Akiko', '415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', '94595', 1);
INSERT Tb_Autor VALUES('267-41-2394', 'O Leary', 'Michael', '408 286-2428', '22 Cleveland Av. #14', 'San Jose', 'CA', '95128', 1);
INSERT Tb_Autor VALUES('472-27-2349', 'Gringlesby', 'Burt', '707 938-6445', 'PO Box 792', 'Covelo', 'CA', '95428', 3);
INSERT Tb_Autor VALUES('527-72-3246', 'Greene', 'Morningstar', '615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', '37215', 0);
INSERT Tb_Autor VALUES('172-32-1176', 'White', 'Johnson', '408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025', 1);
INSERT Tb_Autor VALUES('712-45-1867', 'del Castillo', 'Innes', '615 996-8275', '2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105', 1);
INSERT Tb_Autor VALUES('846-92-7186', 'Hunter', 'Sheryl', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
INSERT Tb_Autor VALUES('486-29-1786', 'Locksley', 'Charlene', '415 585-4620', '18 Broadway Av.', 'San Francisco', 'CA', '94130', 1);
INSERT Tb_Autor VALUES('648-92-1872', 'Blotchet-Halls', 'Reginald', '503 745-6402', '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330', 1);
INSERT Tb_Autor VALUES('341-22-1782', 'Smith', 'Meander', '913 843-0462', '10 Mississippi Dr.', 'Lawrence', 'KS', '66044', 0);



INSERT Tb_Verleger VALUES('0736', 'New Moon Books', 'Boston', 'MA', 'USA');
INSERT Tb_Verleger VALUES('0877', 'Binnet & Hardley', 'Washington', 'DC', 'USA');
INSERT Tb_Verleger VALUES('1389', 'Algodata Infosystems', 'Berkeley', 'CA', 'USA');
INSERT Tb_Verleger VALUES('9952', 'Scootney Books', 'New York', 'NY', 'USA');
INSERT Tb_Verleger VALUES('1622', 'Five Lakes Publishing', 'Chicago', 'IL', 'USA');
INSERT Tb_Verleger VALUES('1756', 'Ramona Publishers', 'Dallas', 'TX', 'USA');
INSERT Tb_Verleger VALUES('9901', 'GGG&G', 'Mnchen', NULL, 'Germany');
INSERT Tb_Verleger VALUES('9999', 'Lucerne Publishing', 'Paris', NULL, 'France');




INSERT Tb_V_info VALUES('0736', 0xFFFFFFFF, 'None yet');
INSERT Tb_V_info VALUES('0877', 0xFFFFFFFF, 'None yet');
INSERT Tb_V_info VALUES('1389', 0xFFFFFFFF, 'None yet');
INSERT Tb_V_info VALUES('9952', 0xFFFFFFFF, 'None yet');
INSERT Tb_V_info VALUES('1622', 0xFFFFFFFF, 'None yet');
INSERT Tb_V_info VALUES('1756', 0xFFFFFFFF, 'None yet');
INSERT Tb_V_info VALUES('9901', 0xFFFFFFFF, 'None yet');
INSERT Tb_V_info VALUES('9999', 0xFFFFFFFF, 'None yet');




INSERT Tb_Buch VALUES ('PC8888', 'Secrets of Silicon Valley', 'popular_comp', '1389', 20.00, 8000.00, 10, 4095, 'Muckraking reporting on the world s largest computer hardware and software manufacturers.', '1994-06-12');

INSERT Tb_Buch VALUES ('BU1032', 'The Busy Executive s Database Guide', 'business','1389', 19.99, 5000.00, 10, 4095, 'An overview of available database systems with emphasis on common business applications. Illustrated.', '1991-06-12');

INSERT Tb_Buch VALUES ('PS7777', 'Emotional Security: A New Algorithm', 'psychology','0736', 7.99, 4000.00, 10, 3336, 'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.','1991-06-12');

INSERT Tb_Buch VALUES ('PS3333', 'Prolonged Data Deprivation: Four Case Studies','psychology', '0736', 19.99, 2000.00, 10, 4072, 'What happens when the data runs dry? Searching evaluations of information-shortage effects.', '1991-06-12');

INSERT Tb_Buch VALUES ('BU1111', 'Cooking with Computers: Surreptitious Balance Sheets','business', '1389', 11.95, 5000.00, 10, 3876, 'Helpful hints on how to use your electronic resources to the best advantage.', '1991-06-09');

INSERT Tb_Buch VALUES ('MC2222', 'Silicon Valley Gastronomic Treats', 'mod_cook', '0877',19.99, 0.00, 12, 2032, 'Favorite recipes for quick, easy, and elegant meals.','1991-06-09');

INSERT Tb_Buch VALUES ('TC7777', 'Sushi, Anyone?', 'trad_cook', '0877', 14.99, 8000.00,10, 4095, 'Detailed instructions on how to make authentic Japanese sushi in your spare time.', '1991-06-12');

INSERT Tb_Buch VALUES ('TC4203', 'Fifty Years in Buckingham Palace Kitchens', 'trad_cook','0877', 11.95, 4000.00, 14, 15096, 'More anecdotes from the Queen s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','1991-06-12');

INSERT Tb_Buch VALUES ('PC1035', 'But Is It User Friendly?', 'popular_comp', '1389',22.95, 7000.00, 16, 8780, 'A survey of software for the naive user, focusing on the friendliness of each.', '1991-06-30');

INSERT Tb_Buch VALUES('BU2075', 'You Can Combat Computer Stress!', 'business', '0736',2.99, 10125.00, 24, 18722, 'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','1991-06-30');

INSERT Tb_Buch VALUES('PS2091', 'Is Anger the Enemy?', 'psychology', '0736', 10.95,2275.00, 12, 2045, 'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.', '1991-06-15');

INSERT Tb_Buch VALUES('PS2106', 'Life Without Fear', 'psychology', '0736', 7.00, 6000.00,10, 111, 'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.', '1991-10-05');

INSERT Tb_Buch VALUES('MC3021', 'The Gourmet Microwave', 'mod_cook', '0877', 2.99,15000.00, 24, 22246, 'Traditional French gourmet recipes adapted for modern microwave cooking.', '1991-06-18');

INSERT Tb_Buch VALUES('TC3218', 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook', '0877', 20.95, 7000.00, 10, 375, 'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.', '1991-10-21');

INSERT Tb_Buch (Buch_PKy, Titel, FKy_V) VALUES('MC3026', 'The Psychology of Computer Cooking','0877');

INSERT Tb_Buch VALUES ('BU7832', 'Straight Talk About Computers', 'business', '1389',19.99, 5000.00, 10, 4095, 'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.', '1991-06-22');

INSERT Tb_Buch VALUES('PS1372', 'Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology', '0877', 21.59, 7000.00, 10, 375, 'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don t.', '1991-10-21');

INSERT Tb_Buch (Buch_PKy, Titel, Gebiet, FKy_V, Bemerkungen) VALUES('PC9999', 'Net Etiquette','popular_comp', '1389', 'A must-read for computer conferencing.');




INSERT Rel_BuchAutor VALUES('409-56-7008', 'BU1032', 1, 60);
INSERT Rel_BuchAutor VALUES('486-29-1786', 'PS7777', 1, 100);
INSERT Rel_BuchAutor VALUES('486-29-1786', 'PC9999', 1, 100);
INSERT Rel_BuchAutor VALUES('712-45-1867', 'MC2222', 1, 100);
INSERT Rel_BuchAutor VALUES('172-32-1176', 'PS3333', 1, 100);
INSERT Rel_BuchAutor VALUES('213-46-8915', 'BU1032', 2, 40);
INSERT Rel_BuchAutor VALUES('238-95-7766', 'PC1035', 1, 100);
INSERT Rel_BuchAutor VALUES('213-46-8915', 'BU2075', 1, 100);
INSERT Rel_BuchAutor VALUES('998-72-3567', 'PS2091', 1, 50);
INSERT Rel_BuchAutor VALUES('899-46-2035', 'PS2091', 2, 50);
INSERT Rel_BuchAutor VALUES('998-72-3567', 'PS2106', 1, 100);
INSERT Rel_BuchAutor VALUES('722-51-5454', 'MC3021', 1, 75);
INSERT Rel_BuchAutor VALUES('899-46-2035', 'MC3021', 2, 25);
INSERT Rel_BuchAutor VALUES('807-91-6654', 'TC3218', 1, 100);
INSERT Rel_BuchAutor VALUES('274-80-9391', 'BU7832', 1, 100);
INSERT Rel_BuchAutor VALUES('427-17-2319', 'PC8888', 1, 50);
INSERT Rel_BuchAutor VALUES('846-92-7186', 'PC8888', 2, 50);
INSERT Rel_BuchAutor VALUES('756-30-7391', 'PS1372', 1, 75);
INSERT Rel_BuchAutor VALUES('724-80-9391', 'PS1372', 2, 25);
INSERT Rel_BuchAutor VALUES('724-80-9391', 'BU1111', 1, 60);
INSERT Rel_BuchAutor VALUES('267-41-2394', 'BU1111', 2, 40);
INSERT Rel_BuchAutor VALUES('672-71-3249', 'TC7777', 1, 40);
INSERT Rel_BuchAutor VALUES('267-41-2394', 'TC7777', 2, 30);
INSERT Rel_BuchAutor VALUES('472-27-2349', 'TC7777', 3, 30);
INSERT Rel_BuchAutor VALUES('648-92-1872', 'TC4203', 1, 100);




INSERT Tb_Buchhandlung VALUES('7066','Barnum s','567 Pasadena Ave.','Tustin','CA','92789');
INSERT Tb_Buchhandlung VALUES('7067','News & Brews','577 First St.','Los Gatos','CA','96745');
INSERT Tb_Buchhandlung VALUES('7131','Doc-U-Mat: Quality Laundry and Books', '24-A Avogadro Way','Remulade','WA','98014');
INSERT Tb_Buchhandlung VALUES('8042','Bookbeat','679 Carson St.','Portland','OR','89076');
INSERT Tb_Buchhandlung VALUES('6380','Eric the Read Books','788 Catamaugus Ave.', 'Seattle','WA','98056');
INSERT Tb_Buchhandlung VALUES('7896','Fricative Bookshop','89 Madison St.','Fremont','CA','90019');




INSERT Tb_Auftrag VALUES('7066', 'QA7442.3', '1994-09-09', 75, 'ON invoice','PS2091');
INSERT Tb_Auftrag VALUES('7067', 'D4482', '1994-09-09', 10, 'Net 60','PS2091');
INSERT Tb_Auftrag VALUES('7131', 'N914008', '1994-08-09', 20, 'Net 30','PS2091');
INSERT Tb_Auftrag VALUES('7131', 'N914014', '1994-04-09', 25, 'Net 30','MC3021');
INSERT Tb_Auftrag VALUES('8042', '423LL922', '1994-04-09', 15, 'ON invoice','MC3021');
INSERT Tb_Auftrag VALUES('8042', '423LL930', '1994-04-09', 10, 'ON invoice','BU1032');
INSERT Tb_Auftrag VALUES('6380', '722a', '1994-03-09', 3, 'Net 60','PS2091');
INSERT Tb_Auftrag VALUES('6380', '6871', '1994-04-09', 5, 'Net 60','BU1032');
INSERT Tb_Auftrag VALUES('8042','P723', '1993-01-03', 25, 'Net 30', 'BU1111');
INSERT Tb_Auftrag VALUES('7896','X999', '1993-02-02', 35, 'ON invoice', 'BU2075');
INSERT Tb_Auftrag VALUES('7896','QQ2299', '1993-08-10', 15, 'Net 60', 'BU7832');
INSERT Tb_Auftrag VALUES('7896','TQ456', '1993-07-12', 10, 'Net 60', 'MC2222');
INSERT Tb_Auftrag VALUES('8042','QA879.1', '1993-07-5', 30, 'Net 30', 'PC1035');
INSERT Tb_Auftrag VALUES('7066','A2976', '1993-04-5', 50, 'Net 30', 'PC8888');
INSERT Tb_Auftrag VALUES('7131','P3087a', '1993-04-5', 20, 'Net 60', 'PS1372');
INSERT Tb_Auftrag VALUES('7131','P3087a', '1993-04-5', 25, 'Net 60', 'PS2106');
INSERT Tb_Auftrag VALUES('7131','P3087a', '1993-04-5', 15, 'Net 60', 'PS3333');
INSERT Tb_Auftrag VALUES('7131','P3087a', '1993-04-5', 25, 'Net 60', 'PS7777');
INSERT Tb_Auftrag VALUES('7067','P2121', '1992-05-6', 40, 'Net 30', 'TC3218');
INSERT Tb_Auftrag VALUES('7067','P2121', '1992-05-6', 20, 'Net 30', 'TC4203');
INSERT Tb_Auftrag VALUES('7067','P2121', '1992-05-6', 20, 'Net 30', 'TC7777');




INSERT Tb_Tantiemen VALUES('BU1032', 0, 5000, 10);
INSERT Tb_Tantiemen VALUES('BU1032', 5001, 50000, 12);
INSERT Tb_Tantiemen VALUES('PC1035', 0, 2000, 10);
INSERT Tb_Tantiemen VALUES('PC1035', 2001, 3000, 12);
INSERT Tb_Tantiemen VALUES('PC1035', 3001, 4000, 14);
INSERT Tb_Tantiemen VALUES('PC1035', 4001, 10000, 16);
INSERT Tb_Tantiemen VALUES('PC1035', 10001, 50000, 18);
INSERT Tb_Tantiemen VALUES('BU2075', 0, 1000, 10);
INSERT Tb_Tantiemen VALUES('BU2075', 1001, 3000, 12);
INSERT Tb_Tantiemen VALUES('BU2075', 3001, 5000, 14);
INSERT Tb_Tantiemen VALUES('BU2075', 5001, 7000, 16);
INSERT Tb_Tantiemen VALUES('BU2075', 7001, 10000, 18);
INSERT Tb_Tantiemen VALUES('BU2075', 10001, 12000, 20);
INSERT Tb_Tantiemen VALUES('BU2075', 12001, 14000, 22);
INSERT Tb_Tantiemen VALUES('BU2075', 14001, 50000, 24);
INSERT Tb_Tantiemen VALUES('PS2091', 0, 1000, 10);
INSERT Tb_Tantiemen VALUES('PS2091', 1001, 5000, 12);
INSERT Tb_Tantiemen VALUES('PS2091', 5001, 10000, 14);
INSERT Tb_Tantiemen VALUES('PS2091', 10001, 50000, 16);
INSERT Tb_Tantiemen VALUES('PS2106', 0, 2000, 10);
INSERT Tb_Tantiemen VALUES('PS2106', 2001, 5000, 12);
INSERT Tb_Tantiemen VALUES('PS2106', 5001, 10000, 14);
INSERT Tb_Tantiemen VALUES('PS2106', 10001, 50000, 16);
INSERT Tb_Tantiemen VALUES('MC3021', 0, 1000, 10);
INSERT Tb_Tantiemen VALUES('MC3021', 1001, 2000, 12);
INSERT Tb_Tantiemen VALUES('MC3021', 2001, 4000, 14);
INSERT Tb_Tantiemen VALUES('MC3021', 4001, 6000, 16);
INSERT Tb_Tantiemen VALUES('MC3021', 6001, 8000, 18);
INSERT Tb_Tantiemen VALUES('MC3021', 8001, 10000, 20);
INSERT Tb_Tantiemen VALUES('MC3021', 10001, 12000, 22);
INSERT Tb_Tantiemen VALUES('MC3021', 12001, 50000, 24);
INSERT Tb_Tantiemen VALUES('TC3218', 0, 2000, 10);
INSERT Tb_Tantiemen VALUES('TC3218', 2001, 4000, 12);
INSERT Tb_Tantiemen VALUES('TC3218', 4001, 6000, 14);
INSERT Tb_Tantiemen VALUES('TC3218', 6001, 8000, 16);
INSERT Tb_Tantiemen VALUES('TC3218', 8001, 10000, 18);
INSERT Tb_Tantiemen VALUES('TC3218', 10001, 12000, 20);
INSERT Tb_Tantiemen VALUES('TC3218', 12001, 14000, 22);
INSERT Tb_Tantiemen VALUES('TC3218', 14001, 50000, 24);
INSERT Tb_Tantiemen VALUES('PC8888', 0, 5000, 10);
INSERT Tb_Tantiemen VALUES('PC8888', 5001, 10000, 12);
INSERT Tb_Tantiemen VALUES('PC8888', 10001, 15000, 14);
INSERT Tb_Tantiemen VALUES('PC8888', 15001, 50000, 16);
INSERT Tb_Tantiemen VALUES('PS7777', 0, 5000, 10);
INSERT Tb_Tantiemen VALUES('PS7777', 5001, 50000, 12);
INSERT Tb_Tantiemen VALUES('PS3333', 0, 5000, 10);
INSERT Tb_Tantiemen VALUES('PS3333', 5001, 10000, 12);
INSERT Tb_Tantiemen VALUES('PS3333', 10001, 15000, 14);
INSERT Tb_Tantiemen VALUES('PS3333', 15001, 50000, 16);
INSERT Tb_Tantiemen VALUES('BU1111', 0, 4000, 10);
INSERT Tb_Tantiemen VALUES('BU1111', 4001, 8000, 12);
INSERT Tb_Tantiemen VALUES('BU1111', 8001, 10000, 14);
INSERT Tb_Tantiemen VALUES('BU1111', 12001, 16000, 16);
INSERT Tb_Tantiemen VALUES('BU1111', 16001, 20000, 18);
INSERT Tb_Tantiemen VALUES('BU1111', 20001, 24000, 20);
INSERT Tb_Tantiemen VALUES('BU1111', 24001, 28000, 22);
INSERT Tb_Tantiemen VALUES('BU1111', 28001, 50000, 24);
INSERT Tb_Tantiemen VALUES('MC2222', 0, 2000, 10);
INSERT Tb_Tantiemen VALUES('MC2222', 2001, 4000, 12);
INSERT Tb_Tantiemen VALUES('MC2222', 4001, 8000, 14);
INSERT Tb_Tantiemen VALUES('MC2222', 8001, 12000, 16);
INSERT Tb_Tantiemen VALUES('MC2222', 12001, 20000, 18);
INSERT Tb_Tantiemen VALUES('MC2222', 20001, 50000, 20);
INSERT Tb_Tantiemen VALUES('TC7777', 0, 5000, 10);
INSERT Tb_Tantiemen VALUES('TC7777', 5001, 15000, 12);
INSERT Tb_Tantiemen VALUES('TC7777', 15001, 50000, 14);
INSERT Tb_Tantiemen VALUES('TC4203', 0, 2000, 10);
INSERT Tb_Tantiemen VALUES('TC4203', 2001, 8000, 12);
INSERT Tb_Tantiemen VALUES('TC4203', 8001, 16000, 14);
INSERT Tb_Tantiemen VALUES('TC4203', 16001, 24000, 16);
INSERT Tb_Tantiemen VALUES('TC4203', 24001, 32000, 18);
INSERT Tb_Tantiemen VALUES('TC4203', 32001, 40000, 20);
INSERT Tb_Tantiemen VALUES('TC4203', 40001, 50000, 22);
INSERT Tb_Tantiemen VALUES('BU7832', 0, 5000, 10);
INSERT Tb_Tantiemen VALUES('BU7832', 5001, 10000, 12);
INSERT Tb_Tantiemen VALUES('BU7832', 10001, 15000, 14);
INSERT Tb_Tantiemen VALUES('BU7832', 15001, 20000, 16);
INSERT Tb_Tantiemen VALUES('BU7832', 20001, 25000, 18);
INSERT Tb_Tantiemen VALUES('BU7832', 25001, 30000, 20);
INSERT Tb_Tantiemen VALUES('BU7832', 30001, 35000, 22);
INSERT Tb_Tantiemen VALUES('BU7832', 35001, 50000, 24);
INSERT Tb_Tantiemen VALUES('PS1372', 0, 10000, 10);
INSERT Tb_Tantiemen VALUES('PS1372', 10001, 20000, 12);
INSERT Tb_Tantiemen VALUES('PS1372', 20001, 30000, 14);
INSERT Tb_Tantiemen VALUES('PS1372', 30001, 40000, 16);
INSERT Tb_Tantiemen VALUES('PS1372', 40001, 50000, 18);



INSERT Tb_Rabatt VALUES('Initial Customer', NULL, NULL, NULL, 10.5);
INSERT Tb_Rabatt VALUES('Volume Discount', NULL, 100, 1000, 6.7);
INSERT Tb_Rabatt VALUES('Customer Discount', '8042', NULL, NULL, 5.0);