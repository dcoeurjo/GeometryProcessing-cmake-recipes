cmake_minimum_required(VERSION 3.14)
project(geomproc-recipes)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/recipes)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)


include(dgtal)
include(polyscope)
include(cli11)
include(eigen)
include(libigl)
include(geometry-central)
include(catch2)
include(openmp)
include(spdlog)
include(stb)
include(cgal)
include(ponca)
include(directional)
include(boost)
include(cinolib)
include(spectra)
include(robin_map)
include(geogram) #[WIP] c++ std lib version issue (not compatible with c++17)

add_executable(all-in all-in.cpp)
target_link_libraries(all-in PRIVATE cinolib spdlog::spdlog polyscope stb::image Boost::headers CGAL::CGAL
                                     CLI11::CLI11 Eigen3::Eigen igl::core geometry-central Catch2::Catch2
                                     directional OpenMP::OpenMP_CXX Ponca::Fitting Spectra tsl::robin_map
                                     geogram
                                     DGtal ${DGtal_LIBRARIES})
