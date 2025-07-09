if (TARGET DGtal)
  return()
endif()

include(CPM)

message(STATUS "Fetching DGtal")
SET(BUILD_EXAMPLES OFF)
SET(DGTAL_REMOVE_UNINSTALL ON)

CPMAddPackage(
  NAME DGtal
  GITHUB_REPOSITORY "DGtal-team/DGtal"
  GIT_TAG 2.0
)

include("${DGtal_BINARY_DIR}/DGtalConfig.cmake")
include_directories("${DGTAL_INCLUDE_DIRS}")

## Link targets to use: "DGtal ${DGTAL_LIBRARIES}"
