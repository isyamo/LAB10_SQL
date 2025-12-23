-- Création des bases de données
CREATE DATABASE universite_dev CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE universite_prod CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE universite_dev;

-- Création des tables
CREATE TABLE ETUDIANT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    date_naissance DATE,
    date_inscription DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE COURS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(20) UNIQUE NOT NULL,
    titre VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3,
    professeur VARCHAR(100)
);

CREATE TABLE INSCRIPTION (
    id INT PRIMARY KEY AUTO_INCREMENT,
    etudiant_id INT,
    cours_id INT,
    date_inscription DATE,
    note DECIMAL(4,2),
    FOREIGN KEY (etudiant_id) REFERENCES ETUDIANT(id),
    FOREIGN KEY (cours_id) REFERENCES COURS(id)
);

-- Insertion de données d'exemple
INSERT INTO ETUDIANT (nom, prenom, email, date_naissance) VALUES
('Done', 'Jean', 'jean.donet@email.com', '2000-05-15'),
('Moon', 'Sophie', 'sophie.moon@email.com', '2001-08-22');

INSERT INTO COURS (code, titre, credits, professeur) VALUES
('INF1', 'Introduction à la programmation', 4, 'Dr. Smith'),
('MATH2', 'Algèbre linéaire', 5, 'Prof. Johnson'),
('PC', 'Physique quantique', 6, 'Dr. Williams');

INSERT INTO INSCRIPTION (etudiant_id, cours_id, date_inscription, note) VALUES
(1, 1, '2024-09-01', 15.5),
(1, 2, '2024-09-01', 18.0),
(2, 1, '2024-09-02', 16.5),
(2, 3, '2024-09-03', 14.0);


