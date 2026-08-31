# Manuel d'utilisation — EKP-Launcher Windows

## Prérequis

- Windows 10 ou Windows 11 64 bits ;
- Geometry Dash acheté et installé via Steam ;
- Geometry Dash version 2.208 ;
- Geode installé depuis sa source officielle ;
- le fichier du mod EKP Noclip compilé ;
- un compte administrateur Windows si le dossier Steam est protégé.

## Installation

1. Téléchargez ou copiez le dossier `EKP-Launcher` sur le PC.
2. Vérifiez que le mod compilé se trouve dans :

```text
payload\geode\mods\ekp.noclip.geode
```

3. Ouvrez PowerShell dans le dossier EKP-Launcher.
4. Autorisez les scripts uniquement pour la session actuelle :

```powershell
Set-ExecutionPolicy -Scope Process Bypass
```

5. Lancez l'installation :

```powershell
.\launcher\EKP-Launcher.ps1 -Install
```

6. Si Geometry Dash n'est pas trouvé automatiquement, saisissez le chemin du dossier contenant `GeometryDash.exe`.
7. Lancez Geometry Dash normalement depuis Steam.
8. Vérifiez dans Geode que le mod EKP est chargé.

## Désinstallation

Fermez Geometry Dash, puis exécutez :

```powershell
.\launcher\EKP-Launcher.ps1 -Uninstall
```

Le launcher retire les fichiers copiés et restaure les fichiers sauvegardés dans `.ekp-backup`.

## Dépannage

### Geometry Dash est introuvable

Utilisez :

```powershell
.\launcher\EKP-Launcher.ps1 -Open
```

ou indiquez manuellement le dossier contenant `GeometryDash.exe`.

### Le mod n'apparaît pas dans Geode

- vérifiez l'extension `.geode` ;
- vérifiez le chemin `payload\geode\mods` ;
- vérifiez que le mod correspond à Geometry Dash 2.208 ;
- relancez le jeu ;
- consultez les logs Geode.

### Windows bloque le script

Dans PowerShell, utilisez uniquement :

```powershell
Set-ExecutionPolicy -Scope Process Bypass
```

Cette commande ne modifie pas durablement la politique de sécurité du PC.

### Le jeu ne démarre plus

1. Fermez Geometry Dash.
2. Exécutez la désinstallation.
3. Vérifiez les fichiers du jeu depuis Steam.
4. Ne supprimez pas `.ekp-backup` avant la restauration.

## Utilisation responsable

Le mod est prévu pour un usage personnel et hors ligne. N'utilisez pas un Noclip pour les classements, les niveaux en ligne, les compétitions ou les fonctions multijoueur. Ne distribuez pas de fichiers propriétaires de Geometry Dash.
