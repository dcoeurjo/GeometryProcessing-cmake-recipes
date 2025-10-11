if(TARGET tsl::robin_map)
    return()
endif()

message(STATUS "Third-party (external): creating target 'tsl::robin_map'")

include(CPM)

CPMAddPackage(
    NAME robin_map
    VERSION 1.3.0
    GITHUB_REPOSITORY Tessil/robin-map
)
