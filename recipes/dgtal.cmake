if (TARGET DGtal)
  return()
endif()

include(CPM)
include(boost)

message(STATUS "Fetching DGtal")
SET(BUILD_EXAMPLES OFF)
SET(DGTAL_REMOVE_UNINSTALL ON)

CPMAddPackage(
  NAME DGtal
  GITHUB_REPOSITORY "DGtal-team/DGtal"
  GIT_TAG 1.4.2.1
  OPTIONS "-DBoost_DIR=${Boost_INCLUDE_DIRS}"
)

include("${DGtal_BINARY_DIR}/DGtalConfig.cmake")
include_directories("${DGTAL_INCLUDE_DIRS}")
message(STATUS "DGtal include dirs: ${DGTAL_INCLUDE_DIRS}")
message(STATUS "Boost include dirs: ${Boost_DIRS}")

## Link targets to use: "DGtal ${DGTAL_LIBRARIES}"
