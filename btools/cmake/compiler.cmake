cmake_minimum_required (VERSION 3.6)

#message("*** [compiler.cmake] *** Detecting and configuring compiler ...")

if(CMAKE_GENERATOR STREQUAL Xcode)
    set( XCODE 1 )
    add_definitions( -DXCODE )
endif()


# Set compiler flags and options.
# Here it is setting the Visual Studio warning level to 4
#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")


# Command to output information to the console
# Useful for displaying errors, warnings, and debugging
#message ("*** [MESSAGE] Using cxx Flags:" ${CMAKE_CXX_FLAGS})

#include("${CMAKE_CURRENT_LIST_DIR}/PrecompiledHeader.cmake")
#if (UNIVERSAL)
#    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /ZW")
#endif()


#message("*** [compiler.cmake] *** Adding compilation flags ...")
if (IOS_OS OR OSX_OS)
	#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++ -std=c++1z")
	# Turn on ARC
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fobjc-arc")
	#if (IOS)
	#	include("${CMAKE_CURRENT_LIST_DIR}/build_app_ios.cmake.txt")
	#endif()
endif()
