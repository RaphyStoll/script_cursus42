# Script Cursus 42

Bienvenue dans le dépôt **Script Cursus 42** ! Ce dépôt contient une collection de scripts utiles pour le cursus de l'école de programmation 42. Les scripts sont conçus pour aider à automatiser et à faciliter diverses tâches liées aux processus de codage et de test.

## Table des matières

- [Scripts](#scripts)
  - [Surveillance Norminette](#surveillance-norminette)
  - [Exécution de Tests](#exécution-de-tests)
- [Utilisation](#utilisation)
  - [Utilisation de Surveillance Norminette](#utilisation-de-surveillance-norminette)
  - [Utilisation de l'Exécution de Tests](#utilisation-de-lexécution-de-tests)
- [Contribuer](#contribuer)
- [Licence](#licence)

## Scripts

### Surveillance Norminette

Le script **Surveillance Norminette** surveille en continu un répertoire pour détecter les modifications dans les fichiers C et exécute automatiquement l'outil `norminette` pour vérifier les violations de style de code selon les normes de codage de 42. Ce script garantit que toutes les modifications apportées à vos fichiers C sont immédiatement vérifiées pour leur conformité.

### Exécution de Tests Libft

Le script **Exécution de Tests Libft** vous permet d'exécuter une série de tests sur vos fichiers C de votre bibliotheque Libft. Il propose un mode interactif où vous pouvez exécuter des tests individuels avec la possibilité de redémarrer ou de continuer au test suivant, ainsi qu'un mode automatique pour exécuter tous les tests de manière séquentielle. De plus, le script prend en charge les tests bonus.

## Utilisation

### Utilisation de Surveillance Norminette

1. **Installer `fswatch` :** Assurez-vous que `fswatch` est installé sur votre système. Vous pouvez l'installer à l'aide d'un gestionnaire de paquets comme `brew` sur macOS :
    ```sh
    brew install fswatch
    ```
   
2. **Exécuter le script :**
    ```sh
    ./norminette_watcher.sh
    ```
   
   Cela commencera à surveiller le répertoire actuel pour toute modification dans les fichiers C (à l'exclusion des fichiers préfixés par `test_`) et exécutera `norminette` chaque fois que des modifications sont détectées.

### Utilisation de l'Exécution de Tests

1. **Préparer vos exécutables de test :** Assurez-vous que vos exécutables de test sont prêts et situés dans le répertoire spécifié.

2. **Exécuter le script :**
    ```sh
    ./test_runner.sh
    ```
   
   Suivez les invites pour exécuter des tests individuels ou tous les tests automatiquement. Vous pouvez spécifier le répertoire contenant les exécutables de test et choisir d'inclure ou non les tests bonus.

## Contribuer

Nous accueillons les contributions au dépôt **Script Cursus 42** ! Si vous avez un script ou une amélioration à apporter à un script existant, veuillez suivre ces étapes :

1. Forker le dépôt.
2. Créer une nouvelle branche pour votre fonctionnalité ou correction de bug.
3. Apportez vos modifications et validez-les avec des messages descriptifs.
4. Poussez vos modifications sur votre fork.
5. Créez une pull request vers le dépôt principal.

Veuillez vous assurer que vos scripts respectent les normes de codage et sont bien documentés.

## Licence

Ce dépôt est sous licence MIT. Vous êtes libre d'utiliser, de modifier et de distribuer les scripts tant que vous incluez la licence originale. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

N'hésitez pas à nous contacter si vous avez des questions ou si vous avez besoin d'aide !

Bon codage !

L'équipe Script Cursus 42
