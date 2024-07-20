# Script de surveillance de la norminette

Ce script surveille les modifications de fichiers dans un dossier donné et exécute la commande `norminette` sur les fichiers C modifiés. Il affiche ensuite le résultat de la norminette et le sauvegarde.

## Utilisation

1. Assurez-vous d'avoir `norminette` installé sur votre système.
2. Modifiez la variable `folder_to_watch` pour spécifier le dossier que vous souhaitez surveiller.
3. Exécutez le script en utilisant la commande `./script_norme.sh`.

## Fonctionnement détaillé

Le script utilise la commande `fswatch` pour surveiller les modifications de fichiers dans le dossier spécifié par la variable `folder_to_watch`. Lorsqu'un fichier est modifié, le script exécute la commande `norminette` sur tous les fichiers C du dossier (à l'exception des fichiers commençant par "test_") en utilisant la commande `find`. Le résultat de la norminette est ensuite affiché et sauvegardé.

Le script utilise une boucle `while` pour continuer à surveiller les modifications de fichiers en temps réel. Si le résultat de la norminette a changé depuis la dernière exécution, le script efface l'écran avec la commande `clear` et affiche le nouveau résultat.

Cela permet de garder un suivi en temps réel des erreurs de norme dans les fichiers C du dossier surveillé.
