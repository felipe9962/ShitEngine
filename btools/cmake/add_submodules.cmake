cmake_minimum_required(VERSION 3.17)

if (IMPORT_PRE)
    list( APPEND SUBMODULES "pre" )
endif()
if (IMPORT_HAL)
    list( APPEND SUBMODULES "hal" )
endif()
if (IMPORT_RAVENGINE)
    list( APPEND SUBMODULES "ravengine" )
endif()

message(STATUS "--------------------- SUBMODULES ---------------------")
foreach( m ${SUBMODULES} )
    message( "  Adding ${m} module ..." )
    include_directories("${SUBMODULES_PATH}/${m}/include")
    add_subdirectory("${SUBMODULES_PATH}/${m}/project" ${m})
    add_dependencies(${CURRENT_PROJECT_NAME} ${m})
endforeach()
message(STATUS "------------------------------------------------------")
target_link_libraries( 
    ${CURRENT_PROJECT_NAME}
    ${SUBMODULES} 
)
