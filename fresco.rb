class Fresco < Formula
  desc "The handy icon manager for macOS"
  homepage "https://github.com/vanyauhalin/Fresco"
  url "https://github.com/vanyauhalin/Fresco/releases/download/v0.1.2/fresco.tar.zst"
  sha256 "cf654e424917bd715adbe751956e89b3bd54a65f14a17fd5e93c1c7a5baa2b2e"
  license "MIT"
  head "https://github.com/vanyauhalin/Fresco", branch: "main"

  depends_on macos: :high_sierra

  def install
    bin.install "fresco"
  end

  test do
    system bin/"fresco", "--help"
    system bin/"fresco", "version", "0.1.2"
  end
end
