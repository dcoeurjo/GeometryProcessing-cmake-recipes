# GeometryProcessing-cmake-recipes
[![ubuntu/macOS](https://github.com/dcoeurjo/GeomProc-cmake-recipes/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/dcoeurjo/GeomProc-cmake-recipes/actions/workflows/cmake-multi-platform.yml)

This repository contains [cmake](cmake.org)/[CPM](https://github.com/cpm-cmake/CPM.cmake) recipes that I use to easily integrate geometry processing libraries and utilities to my c++ projects.
When included in your `CMakeLists.txt` script, `cmake` will automatically download the deps and prepare the targets.


These scripts are heavily inspired by the external recipes of [Lagrange](https://opensource.adobe.com/lagrange-docs/).

Classical usage (cf `all-in.cpp`):
```cmake
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/PATH-TO-THE-RECIPES)

include(dgtal)
include(libigl)
include(polyscope)
include(geometry-central)
include(geogram)
include(cgal)

add_executable(main main.cpp)
target_link_libraries(main polyscope DGtal ${DGTAL_LIBRARIES} geometry-central igl::core geogram CGAL::CGAL)
```
For system-wide downloads, consider using the `CPM_SOURCE_CACHE` environnement variable (cf [CPM doc](https://github.com/cpm-cmake/CPM.cmake?tab=readme-ov-file#CPM_SOURCE_CACHE))


**Note**: 
- Some recipe combinations could be suboptimal, as a given subproject may be fetched and built several times. Some projects may have dependencies that may not be automatically downloaded by cmake (eg. DGtal needs boost). Please check the instructions provided by the authors.
- For some recipes, the minimal c++ standard is c++17.

# Geometry processing packages
Libs | version | credits
-----|-------- | -----
[DGtal](https://dgtal.org) | ec9586ddb078bee41e01cd5b07cf3ac3e70f8c9f (post 2.0.0) | 
[Ponca](https://poncateam.github.io/ponca) | 1.7 | 
[polyscope](https://polyscope.run) | 2.3.0 | 
[geogram](https://github.com/BrunoLevy/geogram) | 1.9.3 | 
[geometry-central](https://geometry-central.net) | 70c859ec3b58fe597c0063673a74082654e9c5aa |
[Directional](https://avaxman.github.io/Directional/)| ed62c362b59ebd84cdfac520abc37df1bab77290 | 
[cinolib](https://github.com/mlivesu/cinolib) (without gui)|8174c95b590d083b3699e4af95901c51344266ec | 
[eigen](https://eigen.tuxfamily.org) |3.4.0 | [Lagrange](https://opensource.adobe.com/lagrange-docs/)
[libigl](https://libigl.github.io) | 2.5.0 | [Lagrange](https://opensource.adobe.com/lagrange-docs/)
[CGAL](https://cgal.org) | 6.0 | 
[Spectra](https://spectralib.org) | 1.1.0 | 
[stb](https://github.com/nothings/stb) | 5736b15f7ea0ffb08dd38af21067c314d6a3aae9 | [Lagrange](https://opensource.adobe.com/lagrange-docs/)

# Misc.
Libs | version| credits
-----|--------|  --- 
[cli11](https://cliutils.github.io/CLI11/book/)| v2.3.2 | [Lagrange](https://opensource.adobe.com/lagrange-docs/)
[catch2](https://github.com/catchorg/Catch2)| 2.13.7 | [DGtal](https://dgtal.org)
[openmp](openmp.org)| n.a.| [DGtal](https://dgtal.org) 
[spdlog](https://github.com/gabime/spdlog) | 1.14.1 |[Lagrange](https://opensource.adobe.com/lagrange-docs/)
[boost](https://boost.org) | 1.8.2 |[Lagrange](https://opensource.adobe.com/lagrange-docs/)
[robin_map](https://github.com/Tessil/robin-map) | 1.3.0|
