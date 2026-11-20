-- Exécutez avec EXPLAIN ANALYZE une requête listant les 10 plus grosses commandes LIVREE passées en 2026 en utilisant YEAR(date_commande) = 2026. Identifiez les 2 défauts du plan obtenu.

EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE statut = 'LIVREE'
  AND YEAR(date_commande) = 2026
ORDER BY montant_total DESC
LIMIT 10;

-- Les défauts :
-- La fonction YEAR() sur date_commande effectue un parcours complet de la table car elle empêche l'utilisation d'un index sur date_commande
-- Absence d'un index adapté pour éviter le tri sur montant_total DESC 