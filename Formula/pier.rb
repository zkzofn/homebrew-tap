class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.0.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.0.0/pier_v1.0.0_darwin_arm64.tar.gz"
      sha256 "6d8f53eeca9de405ac82b5a177f185ad9b38d69ee44bd5edf31937253ac75d17"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.0.0/pier_v1.0.0_darwin_amd64.tar.gz"
      sha256 "a819c787076c712aba9708d40da9384c3197a888ca74d1b8a66aa781574415e6"
    end
  end

  def install
    bin.install "pier"
  end

  def caveats
    <<~EOS
      Run pier to start — the first run offers to wire tmux and Claude
      Code and to add a shell alias:
        pier
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pier version")
  end
end
