# EKP Noclip iOS

Cible iOS/arm64 pour Geometry Dash 2.208 et Geode Helper.

Le paquet final doit être placé dans :

```text
GeodeHelper/Game/Geode/mods/
```

## Important

Un paquet `.geode` iOS doit être compilé avec le SDK/bindings Geode iOS adaptés. Le paquet Windows n'est pas compatible avec iOS.

Cette première base vérifie le chargement du mod dans les logs. Le hook de gameplay doit être validé contre les bindings exacts de la build iOS 2.208 avant activation.

## Compilation indicative

Depuis un environnement de build Geode iOS configuré :

```bash
geode build --platform ios
```

La commande exacte dépend de la version du SDK et de l'outillage iOS utilisé par le launcher Geode. Le fichier `.geode` produit doit ensuite être intégré dans le Helper par Geode, puis le Helper doit être signé avec le certificat de l'utilisateur.
