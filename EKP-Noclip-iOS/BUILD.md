# Build iOS

1. Installer les outils de développement Geode iOS documentés par le projet Geode iOS Launcher.
2. Configurer les bindings correspondant à Geometry Dash iOS 2.208.
3. Ouvrir ce dossier dans l'environnement de build.
4. Compiler pour arm64.
5. Vérifier que le paquet produit est bien destiné à iOS, pas à Windows.
6. Importer le `.geode` dans Geode/Helper.
7. Laisser Geode générer le Helper IPA.
8. Signer le Helper avec son propre certificat via E-Sign.

Un certificat Geode ne doit pas être copié. Les certificats et clés privées restent externes au projet.
