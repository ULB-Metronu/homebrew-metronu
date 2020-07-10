class Bdsim < Formula
  desc "Beam Delivery Simulation using Geant4"
  homepage "http://www.pp.rhul.ac.uk/bdsim/manual/"
  version "scoring-4D"
  url "https://eramoisi@bitbucket.org/jairhul/bdsim.git", :branch =>"scoring-4D"
  head "https://eramoisi@bitbucket.org/jairhul/bdsim.git"

  depends_on "cmake" => :build
  depends_on "bison"
  depends_on "ulb-metronu/metronu/root"
  depends_on "ulb-metronu/metronu/geant4"

  skip_clean "bin"

  def install

    args = std_cmake_args + %W[
      -DCLING_CXX_PATH=clang++
      -DCMAKE_INSTALL_ELISPDIR=#{elisp}
      -DUSE_BOOST=ON
      -DUSE_AWAKE=ON
    ]

    cxx_version = 14
    args << "-DCMAKE_CXX_STANDARD=#{cxx_version}"

    mkdir "builddir" do
      system "cmake", "..", *args

      system "make", "install"

    end
  end
end
