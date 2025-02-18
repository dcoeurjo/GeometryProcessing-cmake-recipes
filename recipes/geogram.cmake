if(TARGET geogram)
    return()
endif()

include(CPM)

CPMAddPackage(
  NAME geogram
  GIT_TAG v1.9.3
  GITHUB_REPOSITORY "BrunoLevy/geogram"
)
