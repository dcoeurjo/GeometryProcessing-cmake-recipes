if (TARGET CGAL::CGAL)
  return()
endif()

message(STATUS "Third-party (external): creating target 'CGAL::CGAL' (Boost required)")
include(CPM)


# Using a different CPM target to avoid conflicts with the main CGAL targets
CPMAddPackage(
  NAME CGAL_local
  VERSION 6.0
  GITHUB_REPOSITORY "CGAL/cgal"
  DOWNLOAD_ONLY YES
)

set(CGAL_DIR ${CGAL_local_SOURCE_DIR})
message(STATUS "[cgal] CGAL_DIR: ${CGAL_DIR}")

#We only rely on Boost for multiprecision.
#If you want to use the system-wide GMP or MPFR, you need to set this variable to "Default")

set(CGAL_CMAKE_EXACT_NT_BACKEND "BOOST_BACKEND" CACHE STRING "CGAL multiprecision number type backend")
SET(CGAL_DISABLE_GMP ON CACHE BOOL "")
SET(CMAKE_DISABLE_FIND_PACKAGE_GMP ON CACHE BOOL "")
find_package(CGAL REQUIRED)
message(STATUS "[cgal] CGAL_CMAKE_EXACT_NT_BACKEND: ${CGAL_CMAKE_EXACT_NT_BACKEND}")

# Boost and its components
find_package(Boost REQUIRED)

if(NOT Boost_FOUND)
  message(STATUS "[cgal] This project requires the Boost library.")
  return()
endif()
