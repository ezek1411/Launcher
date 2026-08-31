cmake_minimum_required(VERSION 3.21)

set(PROJECT_NAME EKPNoclip)
project(${PROJECT_NAME} VERSION 1.0.0)

if (NOT DEFINED ENV{GEODE_SDK})
    message(FATAL_ERROR "GEODE_SDK n'est pas configure")
endif()

include($ENV{GEODE_SDK}/cmake/GeodeFile.cmake)

add_library(${PROJECT_NAME} SHARED src/main.cpp)
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_20)

set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")

setup_geode_mod(${PROJECT_NAME})
