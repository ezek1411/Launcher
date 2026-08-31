# EKP Noclip — Geometry Dash 2.208

Mod Geode ciblé exclusivement sur Geometry Dash 2.208 Windows.

## Compilation

La compilation doit être faite sur Windows avec Geode SDK et CMake. Ne pas utiliser une copie crackée du jeu.

```powershell
geode new
geode build
```

Le fichier produit doit être copié dans :

```text
Geometry Dash/geode/mods/
```

## État

Ce dossier contient la cible et la documentation du mod. Les hooks de gameplay doivent être validés contre les bindings et la build exacte de Geometry Dash 2.208 avant de produire un `.geode` final. Une implémentation non testée pourrait faire planter le jeu ou modifier la progression de manière inattendue.

## Test

Tester uniquement hors ligne, avec une sauvegarde des données du jeu. Ne pas utiliser pour les classements, le multijoueur ou les niveaux en ligne.
