/*
SQL-script
Datenbank FoodShop komplett
zum bearbeiten der Select-Aufgaben
Ktm, Da, Pm
*/

#Erstellen DB "FoodShop"
drop database IF exists FoodShop;
create database FoodShop;

USE FoodShop;

DROP TABLE IF EXISTS abteilung;
#
# Tabellenstruktur fuer Tabelle `abteilung`
#
CREATE TABLE abteilung (
  IDAbteilung int(2) NOT NULL,
  Bezeichnung varchar(25) NOT NULL default '',
  PRIMARY KEY  (IDAbteilung)
);

DROP TABLE IF EXISTS bestellung;
#
# Tabellenstruktur fuer Tabelle `bestellung`
#
CREATE TABLE bestellung (
  IDBestellung int(8) NOT NULL default '0',
  KundeID int(5) NOT NULL default '0',
  MitarbeiterID int(3) NOT NULL default '0',
  Bestelldatum date NOT NULL default '0000-00-00',
  Liefdatum date NOT NULL default '0000-00-00',
  Bezahlt int(1) NOT NULL default '0',
  PRIMARY KEY  (IDBestellung)
);

DROP TABLE IF EXISTS bestpos;
#
# Tabellenstruktur fuer Tabelle `bestpos`
#
CREATE TABLE bestpos (
  BestellungID int(8) NOT NULL default '0',
  ProduktID int(3) NOT NULL default '0',
  Menge int(4) NOT NULL default '0',
  PRIMARY KEY (BestellungID, ProduktID)
);



DROP TABLE IF EXISTS funktion;
#
# Tabellenstruktur fuer Tabelle `funktion`
#
CREATE TABLE funktion (
  IDFunktion int(2) NOT NULL default '0',
  Taetigkeit varchar(30) NOT NULL default '',
  PRIMARY KEY  (IDFunktion)
);


DROP TABLE IF EXISTS kunde;
#
# Tabellenstruktur fuer Tabelle `kunde`
#
CREATE TABLE kunde (
  IDKunde int(5) NOT NULL default '0',
  Kundenname varchar(30) NOT NULL default '',
  Strasse varchar(30) NOT NULL default '',
  Plz varchar(5) NOT NULL default '',
  Ort varchar(30) NOT NULL default '',
  Telefon varchar(30) NOT NULL default '',
  PRIMARY KEY  (IDKunde)
);



DROP TABLE IF EXISTS mitarbeiter;
#
# Tabellenstruktur fuer Tabelle `mitarbeiter`
#
CREATE TABLE mitarbeiter(
  IDMitarbeiter int(3) NOT NULL default '0',
  MitarbeiterName varchar(30) NOT NULL default '',
  Vorname varchar(30) NOT NULL default '',
  FunktionID int(2) NOT NULL default '0',
  AbteilungID int(2) NOT NULL default '0',
  Gehalt decimal(9,2) NOT NULL default '0.00',
  eingestellt date NOT NULL default '0000-00-00',
  PRIMARY KEY  (IDMitarbeiter)
);



DROP TABLE IF EXISTS produkt;
#
# Tabellenstruktur fuer Tabelle `produkt`
#
CREATE TABLE produkt (
  IDProdukt int(3) NOT NULL default '0',
  Bezeichnung varchar(30) NOT NULL default '',
  Preis decimal(9,2) NOT NULL default '0.00',
  PRIMARY KEY (IDProdukt)
);

