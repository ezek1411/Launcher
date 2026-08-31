# Manuel de compilation d'un mod `.geode` sous Windows

Ce manuel vise Geometry Dash **2.208** et un mod Geode personnel. Il ne couvre pas les copies non officielles du jeu.

## 1. Installer les outils

Installer :

- Geometry Dash depuis Steam ;
- Visual Studio 2022 Community avec **Desktop development with C++** ;
- CMake 3.29 ou plus récent ;
- Git ;
- Geode CLI ;
- VS Code et les extensions **CMake Tools** et **Geode** (recommandé).

La documentation officielle recommande aussi Clang/Ninja selon la configuration.

## 2. Installer Geode CLI

Avec Scoop :

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop bucket add extras
scoop install geode-sdk-cli
```

Vérifier :

```powershell
geode --version
```

## 3. Configurer le profil Geode

Créer un profil et installer le SDK avec les commandes proposées par la CLI :

```powershell
geode config create
geode sdk install
```

Si une commande varie selon la version de la CLI, afficher l'aide :

```powershell
geode --help
geode sdk --help
```

Configurer ensuite le chemin de Geometry Dash lorsque la CLI le demande. Le chemin Steam ressemble souvent à :

```text
C:\Program Files (x86)\Steam\steamapps\common\Geometry Dash
```

## 4. Créer le projet

Depuis le dossier où placer le projet :

```powershell
geode new
```

Choisir un identifiant unique, par exemple :

```text
ekp.noclip
```

La CLI crée notamment :

```text
CMakeLists.txt
mod.json
about.md
logo.png
src\main.cpp
```

## 5. Développer le mod

Modifier les fichiers dans `src`. La cible doit rester Geometry Dash 2.208 et les API utilisées doivent correspondre à la version du SDK installée.

Ne jamais copier de fichiers de Geometry Dash dans le dépôt. Ne pas intégrer de certificat, de clé privée ou de binaire propriétaire.

## 6. Compiler

Dans le dossier du mod :

```powershell
geode build
```

Pour demander une configuration de développement :

```powershell
geode build --config RelWithDebInfo
```

Si la CLI n'est pas utilisée :

```powershell
cmake -B build
cmake --build build --config RelWithDebInfo
```

Le paquet `.geode` se trouve dans le dossier de sortie `build` ou dans le chemin indiqué par la CLI. Le nom ressemble à :

```text
ekp.noclip.geode
```

## 7. Installation automatique

Si un profil Geode est configuré, `geode build` peut installer automatiquement le mod dans le dossier de Geometry Dash.

Sinon, copier manuellement le fichier dans :

```text
Geometry Dash\geode\mods\
```

Puis lancer Geometry Dash depuis Steam.

## 8. Utiliser EKP-Launcher

Pour utiliser notre installateur :

1. placer `ekp.noclip.geode` dans :

```text
EKP-Launcher\payload\geode\mods\
```

2. ouvrir PowerShell dans le dossier EKP-Launcher ;
3. exécuter :

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\launcher\EKP-Launcher.ps1 -Install
```

Désinstaller :

```powershell
.\launcher\EKP-Launcher.ps1 -Uninstall
```

## 9. Dépannage

### `geode` n'est pas reconnu

Fermer et rouvrir PowerShell après l'installation de la CLI. Vérifier que le dossier de Geode CLI est dans le `PATH`.

### Les headers Geode sont introuvables

Installer le SDK et reconfigurer CMake :

```powershell
geode sdk install
geode build
```

Dans VS Code, relancer `CMake: Delete Cache and Reconfigure`.

### Le mod n'apparaît pas

- vérifier que le fichier finit par `.geode` ;
- vérifier le dossier `Geometry Dash\geode\mods` ;
- vérifier l'identifiant dans `mod.json` ;
- utiliser la bonne version du SDK ;
- lire les logs de Geode.

### Geometry Dash plante

Retirer le mod, restaurer la sauvegarde, puis compiler en `RelWithDebInfo`. Tester avec une installation officielle et une copie de sauvegarde des données utilisateur.

## 10. Sources

- Documentation création et compilation : https://docs.geode-sdk.org/getting-started/create-mod/
- Configuration IDE : https://docs.geode-sdk.org/getting-started/ide-setup/
- Dépôt Geode : https://github.com/geode-sdk/geode

Les commandes peuvent changer entre versions de Geode CLI. Toujours vérifier `geode --help` et la documentation officielle avant une mise à jour.
