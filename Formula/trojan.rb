class Trojan < Formula
  desc "An unidentifiable mechanism that helps you bypass GFW."
  homepage "https://trojan-gfw.github.io/trojan/"
  url "https://github.com/trojan-gfw/trojan/archive/v1.10.0.tar.gz"
  sha256 "f604e5d0b63f05960a1795136205cb54fb7d1265c77e9d1213cf1fac79a1d24e"
  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "openssl@1.1"
  depends_on "python" => :test
  depends_on "coreutils" => :test

  def install
    system "cmake", ".", *std_cmake_args, "-DENABLE_MYSQL=OFF"
    system "make", "install"
  end

  test do
    system "git", "clone", "--branch=v1.10.0", "https://github.com/trojan-gfw/trojan.git"
    system "sh", "-c", "cd trojan/tests/LinuxSmokeTest && ./basic.sh /usr/local/bin/trojan"
    system "sh", "-c", "cd trojan/tests/LinuxSmokeTest && ./fake-client.sh /usr/local/bin/trojan"
  end
end