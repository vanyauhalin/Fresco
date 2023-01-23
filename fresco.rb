class Fresco < Formula
  desc "The handy icon manager for macOS"
  homepage "https://github.com/vanyauhalin/Fresco"
  url "https://github.com/vanyauhalin/Fresco/releases/download/v0.1.0/fresco.tar.zst"
  sha256 "88e8175eafe9bb777bf259a673ea4757b0aee4412d48781816cb37fb1f7069ce"
  license "MIT"
  head "https://github.com/vanyauhalin/Fresco", branch: "main"

  depends_on macos: :high_sierra

  def install
    bin.install "fresco"
  end

  test do
    system bin/"fresco", "--help"
    system bin/"fresco", "version", "0.1.0"
  end
end