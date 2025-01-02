#include <iostream>
#include <DGtal/base/Common.h>
#include <polyscope/polyscope.h>
#include <geometrycentral/surface/meshio.h>
#include <catch2/catch.hpp>
#include <Eigen/Core>
#include <igl/readOFF.h>
#include <stb_image.h>
#include <stb_image_write.h>
#include <spdlog/spdlog.h>
#include <CGAL/Simple_cartesian.h>
#include <directional/index_prescription.h>
#include <directional/CartesianField.h>
#include <boost/filesystem.hpp>

#include <cinolib/meshes/meshes.h>
#include <cinolib/Poisson_sampling.h>

#include <Ponca/Fitting>


int main(int argc, char** argv)
{
  
  std::cout << "All good"<<std::endl;
  
  spdlog::info("Welcome to spdlog!");
  DGtal::trace.info() << "DGtal trace"<<std::endl;
  polyscope::options::autocenterStructures = false;
  Eigen::VectorXd aVector(3);
  aVector << 1, 2, 3;
  
  directional::CartesianField rawFaceField;
  
  {
    //CGAL
    typedef CGAL::Simple_cartesian<double> Kernel;
    typedef Kernel::Point_2 Point_2;
    typedef Kernel::Segment_2 Segment_2;
    Point_2 p(1,1), q(10,10);
    std::cout << "p = " << p << std::endl;
    std::cout << "q = " << q.x() << " " << q.y() << std::endl;
    std::cout << "sqdist(p,q) = " << CGAL::squared_distance(p,q) << std::endl;
  }
  
  {
    //cinolib
    //from 35_Poisson_sampling
    std::vector<cinolib::vec2d> samples_2d;
    cinolib::Poisson_sampling<2, cinolib::vec2d>(0.02f, cinolib::vec2d(0, 0), cinolib::vec2d(1, 1), samples_2d);
  }
  
  {
    //ponca
    class MyPoint
    {
    public:
      enum {Dim = 3};
      typedef double Scalar;
      typedef Eigen::Matrix<Scalar, Dim, 1>   VectorType;
      typedef Eigen::Matrix<Scalar, Dim, Dim> MatrixType;
      
      inline MyPoint(const VectorType& _pos    = VectorType::Zero(),
                     const VectorType& _normal = VectorType::Zero())
      : m_pos(_pos), m_normal(_normal) {}
      inline const VectorType& pos()    const { return m_pos; }
      inline const VectorType& normal() const { return m_normal; }
      inline VectorType& pos()    { return m_pos; }
      inline VectorType& normal() { return m_normal; }
      static inline MyPoint Random()
      {
        VectorType n = VectorType::Random().normalized();
        VectorType p = n * Eigen::internal::random<Scalar>(0.9,1.1);
        return MyPoint (p, (n + VectorType::Random()*0.1).normalized());
      }
      
    private:
      VectorType m_pos, m_normal;
    };
    typedef Ponca::DistWeightFunc<MyPoint,Ponca::SmoothWeightKernel<double> > WeightFunc;
    using Fit = Ponca::Basket<MyPoint,WeightFunc,Ponca::OrientedSphereFit,   Ponca::GLSParam>;
    Fit fit;
    fit.setWeightFunc(WeightFunc(2.0)); // Set a weighting function to weight neighbors
    auto p = MyPoint::Random().pos();
    fit.init(p);
    std::vector<MyPoint> vecs(10);
    for(auto i=0; i < 10; i++)
    {
      vecs[i] = MyPoint::Random();
      fit.addNeighbor(vecs[i]);
    }
    fit.finalize();
    fit.compute(vecs.begin(), vecs.end());
    std::cout << "Center: [" << fit.center().transpose() << "] ;  radius: " << fit.radius() << std::endl;
    std::cout << "The initial point " << p.transpose()              << std::endl
    << "Is projected at   " << fit.project(p).transpose() << std::endl;
  }
  
  return 0;
}
