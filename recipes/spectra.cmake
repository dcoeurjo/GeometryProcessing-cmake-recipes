if(TARGET Spectra)
    return()
endif()

message(STATUS "Third-party (external): creating target 'Spectra'")

include(CPM)
include(eigen)

CPMAddPackage(
    NAME Spectra
    VERSION 1.1.0
    GITHUB_REPOSITORY yixuan/spectra
    PATCHES "spectra.patch"
)
