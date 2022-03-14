message("**************************************************************************")
message(" Generating module ${CURRENT_PROJECT_NAME}")
message("--------------------------------------------------------------------------")

#message(STATUS "--------------------- PATHS ---------------------")
#message(STATUS "   submodules path = ${SUBMODULES_PATH}")
#message(STATUS "   btools path = ${BTOOLS_PATH}")
#message(STATUS "   project path = ${PROJECT_ROOT_PATH}")
#message(STATUS "   sources path = ${SOURCES_ROOT_PATH}")
#message(STATUS "   third party path = ${THIRDPARTY_ROOT_PATH}")
#message(STATUS "-------------------------------------------------")

# OS detection
include(${BTOOLS_PATH}/cmake/os.cmake)

# Compiler detection
include(${BTOOLS_PATH}/cmake/compiler.cmake)

# Generate sources tree
include(${BTOOLS_PATH}/cmake/gen_source_tree.cmake)

if(GENERATE_EXECUTABLE)
    message(STATUS "Generating executable ${CURRENT_PROJECT_NAME}")
    #message(STATUS "Files to add ${project_sources}")

    file(GLOB_RECURSE app_resources
        ${PROJECT_SOURCE_DIR}/resources/*.storyboard
        ${PROJECT_SOURCE_DIR}/resources/*.glsl
        ${PROJECT_SOURCE_DIR}/resources/*.frag
        ${PROJECT_SOURCE_DIR}/resources/*.vert
    )

    add_executable(
        ${CURRENT_PROJECT_NAME}
        #MACOSX_BUNDLE
        ${project_sources}
        ${app_resources}
    )

    target_link_libraries( 
        ${CURRENT_PROJECT_NAME}
        ${CONAN_LIBS} 
    )

elseif(GENERATE_STATIC_LIBRARY)
    message(STATUS "Generating static library ${CURRENT_PROJECT_NAME}")
    #message(STATUS "Files to add ${project_headers} AND ${project_sources}")
    add_library(
        ${CURRENT_PROJECT_NAME} STATIC
        ${project_headers} ${project_sources}
            ../../sources/Temo.cpp ../../include/Temo.hpp ../../sources/commons/utils.cpp ../../sources/commons/os.cpp ../../sources/vulkan/VulkanInit.cpp ../../sources/gl/window/window_manager_gl.cpp ../../sources/engine/shader/shader.hpp ../../sources/gl/shaders/shader_gl.cpp ../../sources/engine/math/positionable.hpp ../../sources/engine/math/camera.hpp ../../sources/game/test_game.cpp ../../sources/engine/draw/drawable.hpp ../../sources/gl/draw/drawable_gl.hpp ../../sources/gl/data/data_gl.hpp ../../sources/gl/data/model_gl.hpp ../../sources/gl/shaders/program_gl.hpp ../../sources/gl/draw/drawable_link.hpp ../../sources/engine/draw/renderer.hpp ../../sources/engine/draw/scene.hpp ../../sources/gl/draw/renderer_gl.hpp)
endif()

# Adding external dependencies
include(${BTOOLS_PATH}/cmake/add_thirdparty.cmake)

if(GENERATE_EXECUTABLE)
    # Adding external dependencies
    include(${BTOOLS_PATH}/cmake/add_submodules.cmake)
endif()

message("**************************************************************************")
