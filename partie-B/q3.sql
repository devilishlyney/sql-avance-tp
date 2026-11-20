-- Rédigez une requête WITH RECURSIVE affichant tout l'organigramme de employes depuis la CTO (manager_id IS NULL), avec le niveau hiérarchique (niveau) et le chemin complet (chemin).

WITH RECURSIVE organigramme AS (
    SELECT 
        id,
        nom,
        manager_id,
        1 AS niveau,
        CAST(nom AS CHAR(500)) AS chemin
    FROM employes
    WHERE manager_id IS NULL

    UNION ALL

    SELECT 
        employes.id,
        employes.nom,
        employes.manager_id,
        organigramme.niveau + 1,
        CAST(CONCAT(organigramme.chemin, ' -> ', employes.nom) AS CHAR(500))
    FROM employes
    JOIN organigramme ON employes.manager_id = organigramme.id
)
SELECT id, nom, manager_id, niveau, chemin
FROM organigramme
ORDER BY niveau, id;