# This script configures project for building or importing TKJT library.
#
# In case of importing the TKJT library:
#
#  TKJT_ROOT_DIR should be defined to refer the TKJT library path.
#
# In case of building the TKJT library:
#
#  The script requires paths to 3rdparties and modules
#
#	FindOCCT.cmake / OCCT_ROOT_DIR
#	FindTBB.cmake  / TBB_ROOT_DIR
#	FindZLIB.cmake / ZLIB_ROOT_DIR
cmake_minimum_required(VERSION 3.27)
set (CMAKE_CXX_STANDARD 17)

project (TKJT)

# See StackOverflow: https://stackoverflow.com/questions/1487752/how-do-i-instruct-cmake-to-look-for-libraries-installed-by-macports
# Detect if the "port" command is valid on this system; if so, return full path
if (APPLE)
  EXECUTE_PROCESS(COMMAND which port RESULT_VARIABLE DETECT_MACPORTS OUTPUT_VARIABLE MACPORTS_PREFIX ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
  IF (${DETECT_MACPORTS} EQUAL 0)
    set(DETECT_MACPORTS "${DETECT_MACPORTS}" CACHE INTERNAL "DETECT_MACPORTS")
    set(DETECT_MACPORTS "${MACPORTS_PREFIX}" CACHE INTERNAL "MACPORTS_PREFIX")
    # "/opt/local/bin/port" doesn't have libs, so we get the parent directory
    GET_FILENAME_COMPONENT(MACPORTS_PREFIX ${MACPORTS_PREFIX} DIRECTORY)
    # "/opt/local/bin" doesn't have libs, so we get the parent directory
    GET_FILENAME_COMPONENT(MACPORTS_PREFIX ${MACPORTS_PREFIX} DIRECTORY)
    # "/opt/local" is where MacPorts lives, add `/lib` suffix and link
    LINK_DIRECTORIES("${MACPORTS_PREFIX}/lib")
  ENDIF()
endif()

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/CMake")

find_package (OCCT REQUIRED)
find_package (TBB REQUIRED)
find_package (ZLIB REQUIRED)

if(WIN32)
  if(ZLIB_FOUND)
    get_filename_component(ZLIB_LIBRARY_DIR "${ZLIB_LIBRARY}" PATH)
    get_filename_component(ZLIB_LIBRARY_NAME "${ZLIB_LIBRARY}" NAME_WE)
    get_filename_component(ZLIB_ROOT_DIR "${ZLIB_LIBRARY_DIR}" PATH)
    find_program(ZLIB_DLL ${ZLIB_LIBRARY_NAME}.dll NAMES zlib1.dll PATHS "${ZLIB_ROOT_DIR}" "${ZLIB_ROOT_DIR}/bin" NO_DEFAULT_PATH)
  endif(ZLIB_FOUND)
endif(WIN32)

set(ZLIB_LIB "z")

# =============================================================================
# Define production steps
# =============================================================================

set (TKJT_HEADER_DIRS "")
set (TKJT_HEADERS)
set (TKJT_SOURCES)
set (TKJT_PACKAGES)

include_directories(
  ${OCCT_INCLUDE_DIRS}
  ${TBB_INCLUDE_DIRS}
  ${ZLIB_INCLUDE_DIRS}
)

# =============================================================================
# Define production steps : search sources
# =============================================================================

set (CMAKE_SOURCE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src)

file (GLOB SRC_DIRS RELATIVE ${CMAKE_SOURCE_PATH} ${CMAKE_SOURCE_PATH}/*)
foreach (SRC_DIR ${SRC_DIRS})
  if (IS_DIRECTORY ${CMAKE_SOURCE_PATH}/${SRC_DIR})
    list (APPEND TKJT_PACKAGES ${SRC_DIR})
  endif()
endforeach()

foreach (TKJT_PACKAGE ${TKJT_PACKAGES})
  file (GLOB_RECURSE PACKAGE_HEADERS ${CMAKE_SOURCE_PATH}/${TKJT_PACKAGE}/*.hxx)
  file (GLOB_RECURSE PACKAGE_SOURCES ${CMAKE_SOURCE_PATH}/${TKJT_PACKAGE}/*.cxx)
  source_group ("Header Files\\${TKJT_PACKAGE}" FILES ${PACKAGE_HEADERS})
  source_group ("Source Files\\${TKJT_PACKAGE}" FILES ${PACKAGE_SOURCES})
  list (APPEND TKJT_SOURCES ${PACKAGE_SOURCES})
  list (APPEND TKJT_HEADERS ${PACKAGE_HEADERS})
  list (APPEND TKJT_HEADER_DIRS ${CMAKE_SOURCE_PATH}/${TKJT_PACKAGE})
endforeach()

include_directories (${TKJT_HEADER_DIRS})
set(TKJT_HEADER_DIRS "${TKJT_HEADER_DIRS}" CACHE INTERNAL "TKJT_HEADER_DIRS")
add_library (TKJT SHARED ${TKJT_HEADERS} ${TKJT_SOURCES})

target_link_libraries (TKJT ${OCCT_LIB})
target_link_libraries (TKJT ${TBB_LIB})
target_link_libraries (TKJT ${ZLIB_LIB})

if (BUILD_PROJECT STREQUAL "TKJT")
  set_target_properties (TKJT PROPERTIES PUBLIC_HEADER "${TKJT_HEADERS}")
endif()

set_target_properties (TKJT PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${TKJT_HEADER_DIRS}")

# =============================================================================
# Define install steps
# =============================================================================

math (EXPR compiler_bitness "32 + 32*(${CMAKE_SIZEOF_VOID_P}/8)")
if (WIN32)
  set (os_with_bit "win${compiler_bitness}")
elseif (APPLE)
  set (os_with_bit "mac${compiler_bitness}")
else()
  set (os_with_bit "lin${compiler_bitness}")
endif()
if (MSVC)
  if (MSVC70)
    set (compiler vc7)
  elseif (MSVC80)
    set (compiler vc8)
  elseif (MSVC90)
    set (compiler vc9)
  elseif (MSVC10)
    set (compiler vc10)
  elseif (MSVC11)
    set (compiler vc11)
  elseif (MSVC12)
    set (compiler vc12)
  endif()
elseif (DEFINED CMAKE_COMPILER_IS_GNUCC)
  set (compiler gcc)
elseif (DEFINED CMAKE_COMPILER_IS_GNUCXX)
  set (compiler gxx)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set (compiler clang)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
  set (compiler icc)
else()
  set (compiler ${CMAKE_GENERATOR})
  string (REGEX REPLACE " " "" compiler ${compiler})
endif()
if (BUILD_PROJECT STREQUAL "TKJT")
  set (RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/${os_with_bit}/${compiler}/bin)
  set (LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/${os_with_bit}/${compiler}/lib)
  set (ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/${os_with_bit}/${compiler}/lib)
  set (PUBLIC_HEADER_DIR ${CMAKE_INSTALL_PREFIX}/inc)
  install (TARGETS TKJT RUNTIME       DESTINATION "${RUNTIME_DIR}"       CONFIGURATIONS ${CMAKE_RELEASE_CONFIGURATIONS}
                        LIBRARY       DESTINATION "${LIBRARY_DIR}"       CONFIGURATIONS ${CMAKE_RELEASE_CONFIGURATIONS}
                        ARCHIVE       DESTINATION "${ARCHIVE_DIR}"       CONFIGURATIONS ${CMAKE_RELEASE_CONFIGURATIONS}
                        PUBLIC_HEADER DESTINATION "${PUBLIC_HEADER_DIR}" CONFIGURATIONS ${CMAKE_RELEASE_CONFIGURATIONS})
  install (TARGETS TKJT RUNTIME       DESTINATION "${RUNTIME_DIR}d"      CONFIGURATIONS ${CMAKE_DEBUG_CONFIGURATIONS}
                        LIBRARY       DESTINATION "${LIBRARY_DIR}d"      CONFIGURATIONS ${CMAKE_DEBUG_CONFIGURATIONS}
                        ARCHIVE       DESTINATION "${ARCHIVE_DIR}d"      CONFIGURATIONS ${CMAKE_DEBUG_CONFIGURATIONS}
                        PUBLIC_HEADER DESTINATION "${PUBLIC_HEADER_DIR}" CONFIGURATIONS ${CMAKE_DEBUG_CONFIGURATIONS})
else()
  if (WIN32)
    install (TARGETS TKJT RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}")
  else()
    install (TARGETS TKJT LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}")
  endif()
endif()
