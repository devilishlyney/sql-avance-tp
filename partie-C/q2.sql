-- Dans le simulateur ACID, reproduisez un Non-Repeatable Read sous READ COMMITTED, puis montrez comment REPEATABLE READ le résout. 
-- Expliquez le rôle du WAL lors d'une coupure serveur en plein virement.

-- Avec READ COMMITTED, une même lecture peut donner deux résultats différents si une autre transaction modifie les données. 
-- REPEATABLE READ évite cela en gardant les mêmes valeurs pendant la transaction.
-- Le WAL permet de récupérer les données validées après une coupure du serveur.