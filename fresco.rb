class Fresco < Formula
  desc "The handy icon manager for macOS"
  homepage "https://github.com/vanyauhalin/Fresco"
  url "https://github.com/vanyauhalin/Fresco/releases/download/v0.1.1/fresco.tar.zst"
  sha256 "f107d806ed6a272ddbce8f9b3267819763bdc0b2cf281a7950b4fa121326ef8b"
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
