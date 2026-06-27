# Système de Gestion des Laboratoires

Projet Django intégré regroupant les 6 modules du système de gestion des laboratoires :

- **Projets de recherche** (Pr35) — Soussan Mohamed, Ouass Mohamed, Al Hammouti Younes
- **Laboratoires** (Pr32) — Bouyaoumad Chaymae, Sellami Hanane
- **Équipements** (Pr33) — El Bairi Asmae, El Azouzi Hanae, Khalifi Ikrame
- **Réservations** (Pr34) — Kadiri Fatima Zahra, Serhrouchni Souhaila, Elmrabet Yasmina
- **Expériences** (Pr36) — El Hazzaoui Abir, Boutaqmani Zineb, El Mahkak Hajar
- **Utilisateurs** (Pr31) — Bouzouf Fouad, Amallah Ilyas, Charki Rayhane

Intégration et coordination du système : **Mohamed Ouass**

---

## Prérequis

- Python 3.x
- MariaDB (ou MySQL)
- VS Code (recommandé)
- DBeaver (ou tout autre client SQL)

---

## Installation

### 1. Créer la base de données

Ouvrir DBeaver ou DBPRO, se connecter à MariaDB (localhost, port 3306), puis exécuter :


CREATE DATABASE dbpro CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'django_user'@'localhost' IDENTIFIED BY 'MotDePasse123';

GRANT ALL PRIVILEGES ON dbpro.* TO 'django_user'@'localhost';

FLUSH PRIVILEGES;
```

### 2. Importer les données

Importer le fichier `dump-dbpro.sql` fourni dans la base `dbpro` via DBeaver
(clic droit sur `dbpro` → Tools → Execute SQL Script → sélectionner le fichier).

### 3. Créer l'environnement virtuel

Dans le dossier du projet (`monprojet`), ouvrir un terminal et exécuter :

```bash
python -m venv env
.\env\Scripts\activate
pip install -r requirements.txt
```

### 4. Lancer le serveur

```bash
python manage.py runserver
```

Ouvrir ensuite dans le navigateur :

```
http://127.0.0.1:8000
```

---

## Connexion

Utiliser le compte administrateur suivant pour se connecter :

```
Utilisateur : mohamed
Mot de passe : (fourni séparément)
```

---

## Structure du projet

```
monprojet/
├── core/            -> Projets de recherche
├── laboratoires/    -> Laboratoires, responsables et membres
├── equipements/     -> Équipements
├── reservations/     -> Réservations de matériels
├── experiences/      -> Publications et résultats
├── users/           -> Gestion des utilisateurs et rôles
├── dump-dbpro.sql   -> Sauvegarde de la base de données
├── requirements.txt -> Dépendances Python
└── manage.py
```

---

## En cas de problème

- **Erreur de connexion à la base de données** : vérifier que MariaDB est bien démarré
  (services.msc → MariaDB → Démarrer).
- **ModuleNotFoundError** : vérifier que l'environnement virtuel est activé
  et que `pip install -r requirements.txt` a bien été exécuté.
- **Erreur de migration** : exécuter `python manage.py migrate` après l'import de la base.
