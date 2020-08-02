class Zgoubi < Formula
  desc "Zgoubi: A ray-tracing code in use for charged particle beam dynamics simulations"
  homepage "https://sourceforge.net/projects/zgoubi/"
  version "develop"
  url "https://github.com/ULB-Metronu/zgoubi.git", :branch =>"develop"
  head "https://github.com/ULB-Metronu/zgoubi.git"

  depends_on "cmake" => :build
  depends_on "gcc"

  skip_clean "bin"

  def install
  mkdir "build" do
    system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
    system "make"
    system "make", "install"
 end
end
end
