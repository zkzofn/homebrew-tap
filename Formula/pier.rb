class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.1.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.1.0/pier_v1.1.0_darwin_arm64.tar.gz"
      sha256 "00f77a054ad022da32ac4b9c1a9e0dfe81de24be4f8fee9b9442c06c08d76381"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.1.0/pier_v1.1.0_darwin_amd64.tar.gz"
      sha256 "f052f1fa2d4681eb3cad3bfd129c89d93f8a4d73b5a5c014e93ad590fad592a9"
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
