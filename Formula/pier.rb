class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "0.4.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v0.4.0/pier_v0.4.0_darwin_arm64.tar.gz"
      sha256 "c97259bcb69caa798bd34fc5a208da8c2a6111d11e8eef02ee1a6dd68728c9a4"
    else
      url "https://github.com/zkzofn/pier/releases/download/v0.4.0/pier_v0.4.0_darwin_amd64.tar.gz"
      sha256 "cc22c7e3f5e59ee13d35a4c1b464df7ffaf728fa7e9a3a5eefd37dab02472728"
    end
  end

  def install
    bin.install "pier"
  end

  def caveats
    <<~EOS
      Wire pier into tmux and Claude Code (idempotent):
        pier setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pier version")
  end
end
