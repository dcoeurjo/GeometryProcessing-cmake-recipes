if (TARGET polyscope)
  return()
endif()

include(CPM)

CPMAddPackage(
  NAME polyscope
  VERSION 2.3.0
  GITHUB_REPOSITORY "nmwsharp/polyscope"
)
