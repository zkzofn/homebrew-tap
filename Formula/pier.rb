class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "0.4.1"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v0.4.1/pier_v0.4.1_darwin_arm64.tar.gz"
      sha256 "4daf1b8f647f507bf4d2c84b7604baf6638d5115c5cfe11e5e154659db02691f"
    else
      url "https://github.com/zkzofn/pier/releases/download/v0.4.1/pier_v0.4.1_darwin_amd64.tar.gz"
      sha256 "b2d2846112f87d96bf55e5c2fbd9d5cb4054df39536ff9d7d8d45641dff9afc3"
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
