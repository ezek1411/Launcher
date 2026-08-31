#include <Geode/Geode.hpp>

using namespace geode::prelude;

$on_mod(Loaded) {
    log::info("EKP Noclip charge — cible Geometry Dash 2.208");
    // Les hooks de gameplay doivent être ajoutés après validation des bindings
    // exacts de la build 2.208. Cette version ne modifie pas le jeu.
}
