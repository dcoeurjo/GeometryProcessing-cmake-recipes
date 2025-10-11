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
  GIT_TAG ec9586ddb078bee41e01cd5b07cf3ac3e70f8c9f
)
