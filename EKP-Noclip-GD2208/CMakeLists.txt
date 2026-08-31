cmake_minimum_required(VERSION 3.21)
project(EKPNoclip VERSION 1.0.0)

add_library(${PROJECT_NAME} SHARED src/main.cpp)

if (NOT DEFINED ENV{GEODE_SDK})
    message(FATAL_ERROR "GEODE_SDK n'est pas configure. Installez Geode SDK puis relancez geode build.")
endif()

# Le SDK Geode fournit la configuration de build et les bindings.
setup_geode_mod(${PROJECT_NAME})
