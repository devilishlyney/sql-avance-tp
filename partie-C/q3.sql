-- Une startup lance une application de covoiturage temps réel nécessitant : (a) le suivi GPS toutes les 3 secondes de 30 000 véhicules, (b) la facturation bancaire des trajets, (c) la suggestion d'itinéraires/amis communs à 3 degrés de séparation. 
-- Proposez une architecture polyglotte justifiée via CAP/PACELC et les 4 critères de choix.

-- J'utiliserais une base NoSQL clé-valeur / séries temporelles comme Cassandra pour stocker les positions GPS, une base relationnelle SQL comme PostgreSQL pour les paiements et une base NoSQL orientée Graphe comme Neo4j pour les itinéraires et les relations entre amis. 
-- Cela permet de privilégier la disponibilité pour le GPS, la cohérence pour les paiements et les performances pour les recherches. 
-- Les 4 critères sont le volume, la vitesse, la cohérence et la disponibilité.