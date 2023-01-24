class Fresco < Formula
  desc "The handy icon manager for macOS"
  homepage "https://github.com/vanyauhalin/Fresco"
  url "https://github.com/vanyauhalin/Fresco/releases/download/v0.1.1/fresco.tar.zst"
  sha256 "0a1f56c361229818d41c243a724c4dbeee59d3934793fa9044035be55fb2c4ee"
  license "MIT"
  head "https://github.com/vanyauhalin/Fresco", branch: "main"

  depends_on macos: :high_sierra

  def install
    bin.install "fresco"
  end

  test do
    system bin/"fresco", "--help"
    system bin/"fresco", "version", "0.1.1"
  end
end
