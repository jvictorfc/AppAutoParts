/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  jvict
 * Created: 2018-08-26
 */

DROP TABLE lignecommande;
DROP TABLE commande;
DROP TABLE MODELE;
DROP TABLE MARQUE;
DROP TABLE PIECE;
DROP TABLE categorie;
DROP TABLE client;

CREATE TABLE client (
	idClient number (4),
	nomClient varchar2(20) CONSTRAINT nomClient_NN NOT NULL,
	adresse varchar2 (40) CONSTRAINT adresse_NN NOT NULL,
	telephone number (10) CONSTRAINT telephone_NN NOT NULL,
	usager varchar2 (10) CONSTRAINT usager_NN NOT NULL,
	pass varchar2 (10) CONSTRAINT pass_NN NOT NULL,
	CONSTRAINT idClient_FK PRIMARY KEY(idClient)
);


CREATE TABLE categorie (
  idCategorie number(4),
  nomCategorie varchar2(20) CONSTRAINT NomCategorie_NN NOT NULL,
  CONSTRAINT  Idecategorie_PK PRIMARY KEY (IdCategorie),
  CONSTRAINT NomCategorie_U UNIQUE (NomCategorie)
); 



CREATE TABLE PIECE(
IdPiece number(4) Constraint Piece_id_pk primary key,
idCategorie number(4) not null,
NomPiece varchar(30) not null,
description varchar(30) not null,
CONSTRAINT Pie_idCat_Cat_FK FOREIGN KEY (idCategorie) REFERENCES categorie(IdCategorie)
);


CREATE TABLE MARQUE(
idmarque number(4) Constraint Marque_id_pk primary key,
nommarque varchar2(20) not null
);


CREATE TABLE MODELE(
idModele number(4) Constraint Modele_id_pk primary key,
idMarque number(4) not null,
nomModele varchar2(20) not null,
CONSTRAINT Mod_idMod_Mar_FK FOREIGN KEY (idMarque) REFERENCES MARQUE(idMarque)
);


CREATE TABLE commande (
  idCommande number(4),
  idClient number(4) NOT NULL,
  dateCommande date CONSTRAINT dateCommande_NN NOT NULL,
  idMod number(4) CONSTRAINT idMod_NN NOT NULL,
  annee number(4) CONSTRAINT annee_NN NOT NULL,
  CONSTRAINT commande_idC_PK PRIMARY KEY(idCommande),
  CONSTRAINT idClient2_FK FOREIGN KEY (idClient) REFERENCES client(idClient)
);


CREATE TABLE lignecommande (
  idCommande number(4),
  idPiece number(4) CONSTRAINT idPiece_NN NOT NULL,
  qtt number(4) CONSTRAINT qtt_NN NOT NULL,
  position varchar2(20) CONSTRAINT iposition_NN NOT NULL,
  cote varchar2(20) CONSTRAINT cote_NN NOT NULL,
  CONSTRAINT idCommande_PK PRIMARY KEY (idCommande,idPiece,position,cote),
  CONSTRAINT idPiece_FK FOREIGN KEY (idPiece) 
			REFERENCES piece(idPiece)

);



INSERT INTO client (idClient,nomClient,adresse,telephone,usager,pass) VALUES(1,'nomClient','adresse',555555555,'wal','wal');
INSERT INTO client (idClient,nomClient,adresse,telephone,usager,pass) VALUES(2,'nomClient','adresse',555555555,'test','test');

INSERT INTO categorie(idCategorie,nomCategorie) VALUES(3, 'Filtres');
INSERT INTO categorie(idCategorie,nomCategorie) VALUES(2, 'Suspension');
INSERT INTO categorie(idCategorie,nomCategorie) VALUES(1, 'Systeme Frein');


INSERT INTO piece (IdPiece, idCategorie, NomPiece, description) VALUES(1, 1, 'Plaquette de Frein', 'p');
INSERT INTO piece (IdPiece, idCategorie, NomPiece, description) VALUES(2, 1, 'Bearing', 'pc');
INSERT INTO piece (IdPiece, idCategorie, NomPiece, description) VALUES(3, 2, 'Amortisseur', 'pc');
INSERT INTO piece (IdPiece, idCategorie, NomPiece, description) VALUES(4, 2, 'Table', 'pc');
INSERT INTO piece (IdPiece, idCategorie, NomPiece, description) VALUES(5, 3, 'Filtre huile ', 'na');


INSERT INTO marque(idmarque, nomMarque) VALUES(1, 'Bmw');
INSERT INTO marque(idmarque, nomMarque) VALUES(2, 'Mazda');
INSERT INTO marque(idmarque, nomMarque) VALUES(3, 'Volvo');
INSERT INTO marque(idmarque, nomMarque) VALUES(4, 'Ford');


INSERT INTO modele (idModele, idMarque, nomModele) VALUES (1, 1, 'G11');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (2, 1, 'G30');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (3, 1, 'X2');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (4, 2, 'Mazda 6');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (5, 2, 'Mazda 3');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (6, 2, 'Protege');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (7, 3, 'V60');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (8, 3, 'V80');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (9, 4, 'F1000');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (10, 4, 'Fiesta');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (11, 4, 'Focus');
INSERT INTO modele (idModele, idMarque, nomModele) VALUES (12, 4, 'Mustang');



INSERT INTO commande (idCommande, idClient, dateCommande, idMod, annee) VALUES(107, 1, '2018-06-11', 2, 2018);
INSERT INTO commande (idCommande, idClient, dateCommande, idMod, annee)  VALUES(108, 1, '2018-06-11', 8, 2004);
INSERT INTO commande (idCommande, idClient, dateCommande, idMod, annee)  VALUES(109, 2, '2018-06-11', 12, 1985);
INSERT INTO commande (idCommande, idClient, dateCommande, idMod, annee)  VALUES(110, 2, '2018-06-11', 5, 2006);
INSERT INTO commande (idCommande, idClient, dateCommande, idMod, annee)  VALUES(112, 1, '2018-06-11', 5, 1986);

INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(107, 1, 1, 'Arrier', 'na');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(107, 3, 1, 'Arrier', 'Gouche');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(108, 4, 1, 'Avant', 'Gouche');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(108, 5, 2, 'na', 'na');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(109, 1, 1, 'Avant', 'na');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(109, 2, 1, 'Arrier', 'Droite');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(110, 1, 1, 'Arrier', 'na');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(110, 1, 2, 'Avant', 'na');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(110, 2, 1, 'Arrier', 'Gouche');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(110, 2, 1, 'Avant', 'Droite');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(110, 3, 4, 'Avant', 'Gouche');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(110, 4, 1, 'Arrier', 'Droite');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(112, 4, 1, 'Avant', 'Droite');
INSERT INTO lignecommande (idCommande, idPiece, qtt, position, cote) VALUES(112, 5, 1, 'na', 'na');

insert into commande values(idCommande_seq.NEXTVAL,2,'2018-06-11',5,2019);

CREATE SEQUENCE idmarque_seq START WITH 1 NOCYCLE;

CREATE SEQUENCE idmodele_seq START WITH 20 NOCYCLE;

CREATE SEQUENCE idpiece_seq START WITH 300 NOCYCLE;

CREATE SEQUENCE idCategorie_seq START WITH 400 NOCYCLE;

CREATE SEQUENCE idCommande_seq START WITH 500 NOCYCLE;

CREATE SEQUENCE client_seq START WITH 600 NOCYCLE;