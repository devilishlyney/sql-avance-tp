-- Expliquez le piège de la requête SELECT id, nom FROM employes WHERE id NOT IN (SELECT manager_id FROM employes); et proposez une correction fiable face aux valeurs NULL.

-- Si la requête contient une valeur NULL, NOT IN peut ne retourner aucun résultat. Il vaut mieux utiliser NOT EXISTS