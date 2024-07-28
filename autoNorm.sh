#!/bin/bash

# Dossier à surveiller
folder_to_watch="."

# Dernier résultat de norminette
last_norminette_result=$(find $folder_to_watch -not -name "test_*" -name "*.c" -exec norminette -R CheckForbiddenSourceHeader {} \;)

# Afficher le résultat initial de norminette
echo "$last_norminette_result"

# Utiliser fswatch pour surveiller les modifications de fichiers
fswatch -o $folder_to_watch | while read f; do
    # Exécuter la commande norminette
    norminette_result=$(find $folder_to_watch -not -name "test_*" -name "*.c" -exec norminette -R CheckForbiddenSourceHeader {} \;)

    # Si le résultat de norminette a changé, l'afficher et le sauvegarder
    if [ "$norminette_result" != "$last_norminette_result" ]; then
        clear
        echo "$norminette_result"
        last_norminette_result=$norminette_result
    fi
done