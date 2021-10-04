class Bdsim < Formula
  desc "Beam Delivery Simulation using Geant4"
  homepage "http://www.pp.rhul.ac.uk/bdsim/manual/"
  version "develop"
  head "https://bitbucket.org/jairhul/bdsim.git", :branch =>"develop"

  depends_on "cmake" => :build
  depends_on "bison"
  depends_on "clhep"
  depends_on "flex"
  depends_on "boost"
  depends_on "ulb/metronu/root"
  depends_on "ulb/metronu/geant4"

  skip_clean "bin"

  def install

    args = std_cmake_args + %W[
      -DCLING_CXX_PATH=clang++
      -DCMAKE_INSTALL_ELISPDIR=#{elisp}
      -DUSE_BOOST=ON
      -DUSE_AWAKE=ON
    ]

    cxx_version = 17
    args << "-DCMAKE_CXX_STANDARD=#{cxx_version}"

    mkdir "builddir" do
      system "cmake", "..", *args

      system "make", "install"

    end
  end
end
