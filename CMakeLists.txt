cmake_minimum_required(VERSION 3.17)

set(CURRENT_PROJECT_NAME opengl_felipe)
project(${CURRENT_PROJECT_NAME})

set(CMAKE_CXX_STANDARD 20)

#add_executable(${CURRENT_PROJECT_NAME} sources/game/main.cpp)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(NO_OUTPUT_DIRS)
# btools
set(PROJECT_ROOT_PATH "${CMAKE_CURRENT_LIST_DIR}")
set(SOURCES_ROOT_PATH "${PROJECT_ROOT_PATH}")
set(BTOOLS_PATH "${PROJECT_ROOT_PATH}/btools")
set(CONAN_DISABLE_CHECK_COMPILER, "")

set(GENERATE_EXECUTABLE TRUE)
include(${BTOOLS_PATH}/cmake/gen_binary.cmake)

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)