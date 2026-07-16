class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "0.3.1"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v0.3.1/pier_v0.3.1_darwin_arm64.tar.gz"
      sha256 "0fb94287f6f6f086084a696c02f7f9e0f4580af4745b9aef37280b84d3409efc"
    else
      url "https://github.com/zkzofn/pier/releases/download/v0.3.1/pier_v0.3.1_darwin_amd64.tar.gz"
      sha256 "6f90dd7585c86a969d133abacec477ac0f8cf01fe865d01df0cdc0bc468c279a"
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
