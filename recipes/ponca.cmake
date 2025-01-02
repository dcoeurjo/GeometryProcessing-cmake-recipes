if(TARGET Ponca::Fitting)
    return()
endif()

include(CPM)
include(eigen)

CPMAddPackage(
  NAME ponca
  GIT_TAG v1.3
  GITHUB_REPOSITORY "poncateam/ponca"
)
