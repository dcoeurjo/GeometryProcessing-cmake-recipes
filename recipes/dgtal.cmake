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
  GIT_TAG 8978c75a29cb4d4a8c44252c0ebde4a3def53f9f
)

include("${DGtal_BINARY_DIR}/DGtalConfig.cmake")
include_directories("${DGTAL_INCLUDE_DIRS}")
message(STATUS "Boost include dirs: ${Boost_DIRS}")

## Link targets to use: "DGtal ${DGTAL_LIBRARIES}"
