cmake_minimum_required(VERSION 3.17)

# glm ----
if(USE_GLM)
    set(GLM_PATH ${THIRDPARTY_ROOT_PATH}/glm)
    include_directories(${GLM_PATH}/include)
endif()
# ------------

# Assimp ----
if(USE_ASSIMP)
    message(STATUS "Including assimp")
    if(OSX_OS)
        #if(POLICY CMP0012)
        #  cmake_policy(SET CMP0012 NEW)
        #endif()
        #link_directories(/usr/local/lib)
        message(STATUS "    ... Did you performed brew install assimp")
        #find_package(assimp REQUIRED)
        #find_package(ASSIMP REQUIRED)
        #include_directories(${ASSIMP_INCLUDE_DIR})
        #target_link_libraries(${CURRENT_PROJECT_NAME} assimp)
        set(ASSIMP_PATH /usr/local/Cellar/assimp/5.0.1)
        target_link_libraries(${CURRENT_PROJECT_NAME} /usr/local/Cellar/assimp/5.0.1/lib/libassimp.dylib)
    else()
        set(ASSIMP_PATH ${THIRDPARTY_ROOT_PATH}/assimp)
        target_link_libraries(${CURRENT_PROJECT_NAME} optimized ${ASSIMP_PATH}/libs/release/assimp-vc142-mtd.lib)
        target_link_libraries(${CURRENT_PROJECT_NAME} optimized ${ASSIMP_PATH}/libs/release/zlibd.lib)
        target_link_libraries(${CURRENT_PROJECT_NAME} optimized ${ASSIMP_PATH}/libs/release/zlibstaticd.lib)
        target_link_libraries(${CURRENT_PROJECT_NAME} optimized ${ASSIMP_PATH}/libs/release/IrrXMLd.lib)

        target_link_libraries(${CURRENT_PROJECT_NAME} debug ${ASSIMP_PATH}/libs/debug/assimp-vc142-mtd.lib)
        target_link_libraries(${CURRENT_PROJECT_NAME} debug ${ASSIMP_PATH}/libs/debug/zlibd.lib)
        target_link_libraries(${CURRENT_PROJECT_NAME} debug ${ASSIMP_PATH}/libs/debug/zlibstaticd.lib)
        target_link_libraries(${CURRENT_PROJECT_NAME} debug ${ASSIMP_PATH}/libs/debug/IrrXMLd.lib)
    endif()
    include_directories(${ASSIMP_PATH}/include)
endif()
# ------------

#Vulkan -----------
if(USE_VULKAN)
    # Vulkan is a required dependency.
    message(STATUS "Including Vulkan")
    include(FindVulkan)
    if(NOT VULKAN_FOUND)
        message(FATAL_ERROR "   Vulkan SDK not installed.")
    else()
        message(STATUS "    Vulkan found!")
        add_compile_definitions(USING_VULKAN)
        #add_definitions(-DUSING_VULKAN)
        target_include_directories(${PROJECT_NAME} PUBLIC ${Vulkan_INCLUDE_DIRS})
        target_link_libraries(${PROJECT_NAME} Vulkan::Vulkan)
        #target_link_libraries(${CURRENT_PROJECT_NAME} ${Vulkan_LIBRARIES})
    endif()

#    find_package(Vulkan REQUIRED)
#    target_link_libraries(${CURRENT_PROJECT_NAME} Vulkan::Vulkan)
endif()
# -----------------

#GLFW ---------------
if(USE_GLFW)
    message(STATUS "Including GLFW")
    if(OSX_OS)
        message(STATUS "    ... Did you performed brew install glfw")
        find_package(glfw3 3.3 REQUIRED)
        target_link_libraries(${CURRENT_PROJECT_NAME} glfw)
    else()
        set(GLFW_PATH ${SUBMODULES_PATH}/dependencies/glfw)
        include_directories(${GLFW_PATH}/include)
        target_link_libraries(${CURRENT_PROJECT_NAME} ${THIRDPARTY_ROOT_PATH}/glfw/libs/glfw3.lib)
    endif()
endif()    
# ---------------