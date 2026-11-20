-- Rédigez une requête avec CTE + fonction de fenêtrage (DENSE_RANK) affichant pour chaque catégorie les 2 produits les plus chers.

WITH classement AS (
    SELECT 
        id,
        nom,
        categorie_id,
        prix_unitaire,
        DENSE_RANK() OVER (
            PARTITION BY categorie_id 
            ORDER BY prix_unitaire DESC
        ) AS rang
    FROM produits
)
SELECT id, nom, categorie_id, prix_unitaire, rang
FROM classement
WHERE rang <= 2;