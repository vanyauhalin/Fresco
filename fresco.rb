class Fresco < Formula
  desc "The handy icon manager for macOS"
  homepage "https://github.com/vanyauhalin/Fresco"
  url "https://github.com/vanyauhalin/Fresco/releases/download/v0.1.1/fresco.tar.zst"
  sha256 "1ade3a6f0d4ca282b0defca8c73311424fe4037a446c5be5f94b7fa208c59f71"
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
