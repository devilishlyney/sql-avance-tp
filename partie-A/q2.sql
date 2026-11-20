-- Créez un index pertinent sur commandes, activez le partitionnement RANGE, et réécrivez la requête de façon SARGable (sans SELECT *).
-- Comparez le coût total avant/après et expliquez l'effet du Partition Pruning.

-- la foreign key empêchait le partitionnement
ALTER TABLE commandes DROP FOREIGN KEY fk_commandes_client;

ALTER TABLE commandes 
PARTITION BY RANGE COLUMNS (date_commande) (
    PARTITION p_2025 VALUES LESS THAN ('2026-01-01 00:00:00'),
    PARTITION p_2026 VALUES LESS THAN ('2027-01-01 00:00:00'),
    PARTITION p_2027 VALUES LESS THAN ('2028-01-01 00:00:00'),
    PARTITION p_max  VALUES LESS THAN MAXVALUE
);

CREATE INDEX idx_commandes_statut_date_montant ON commandes(statut, date_commande, montant_total DESC, client_id);

EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total 
FROM commandes 
WHERE statut = 'LIVREE' AND date_commande >= '2026-01-01' AND date_commande <  '2027-01-01'
ORDER BY montant_total DESC
LIMIT 10;

-- Comparaison avant / après :
-- Coût et temps : Le coût passe de 3.35 à 1.48 et le temps passe de 0.084ms à 0.042ms (temps et coût divisés par deux).
-- Partition Pruning : MySQL ne consulte que la partition contenant les commandes de 2026 (p2026), ce qui réduit les données parcourues et le coût d'exécution.