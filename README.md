# EKP-Launcher — Windows

Installateur personnel pour Geometry Dash 2.208. Le projet prépare l'intégration d'un mod local via une installation Geode existante. Il ne contient pas Geometry Dash et ne distribue aucun fichier propriétaire.

## Utilisation rapide

1. Installer Geometry Dash depuis Steam.
2. Installer Geode depuis sa distribution officielle si nécessaire.
3. Placer les fichiers du mod EKP dans `payload\geode\mods\`.
4. Ouvrir PowerShell dans ce dossier.
5. Exécuter :

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\launcher\EKP-Launcher.ps1 -Install
```

Pour désinstaller :

```powershell
.\launcher\EKP-Launcher.ps1 -Uninstall
```

Pour ouvrir le dossier détecté :

```powershell
.\launcher\EKP-Launcher.ps1 -Open
```

## Fonctionnement

Le launcher recherche `GeometryDash.exe` dans les bibliothèques Steam, crée une sauvegarde dans `.ekp-backup`, puis copie uniquement les fichiers présents dans `payload`. Il ne remplace pas l'exécutable du jeu.

La compilation du mod natif Noclip est une étape séparée avec le SDK Geode et doit être validée sur Geometry Dash 2.208. Aucun certificat Apple ou certificat Geode n'est nécessaire sous Windows.

## Sécurité

- usage personnel et hors ligne ;
- sauvegarde avant toute copie ;
- ne pas utiliser dans les classements ou parties en ligne ;
- ne pas publier de fichiers propriétaires de Geometry Dash.
