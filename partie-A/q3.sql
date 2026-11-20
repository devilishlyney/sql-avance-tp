-- Créez une vue matérialisée mv_synthese_segments calculant le nombre de commandes et le CA total par segment client. 
-- Insérez une nouvelle commande test, constatez que la vue est marquée obsolète (stale), puis rafraîchissez-la et vérifiez la mise à jour.

CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT 
    segment,
    COUNT(commandes.id) AS nb_commandes,
    SUM(commandes.montant_total) AS ca_total
FROM clients
JOIN commandes ON commandes.client_id = clients.id
GROUP BY clients.segment;

SELECT * FROM mv_synthese_segments;

INSERT INTO commandes (client_id, date_commande, montant_total, statut)
VALUES (1, '2026-06-01', 500.00, 'LIVREE');

SELECT * FROM mv_synthese_segments;

REFRESH MATERIALIZED VIEW mv_synthese_segments;

SELECT * FROM mv_synthese_segments;