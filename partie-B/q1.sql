-- On vous soumet une table brute affectations_brutes(employe_id, employe_nom, dept_nom, projets_liste, chef_projet, chef_projet_tel). 
-- Passez-la en 3FN en explicitant les dépendances fonctionnelles et les clés primaires/étrangères.

-- employe_id -> nom, dept_nom
-- chef_id -> nom, telephone
-- projet_id -> nom, chef_id
-- (employe_id, projet_id) -> affectation n-n

CREATE TABLE employes (
    id INT PRIMARY KEY,
    nom VARCHAR(50),
    dept_nom VARCHAR(50)
);

CREATE TABLE chefs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    telephone VARCHAR(20)
);

CREATE TABLE projets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    chef_id INT,
    FOREIGN KEY (chef_id) REFERENCES chefs(id)
);

CREATE TABLE affectations (
    employe_id INT,
    projet_id INT,
    PRIMARY KEY (employe_id, projet_id),
    FOREIGN KEY (employe_id) REFERENCES employes(id),
    FOREIGN KEY (projet_id) REFERENCES projets(id)
);