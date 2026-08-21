class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.1.1"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.1.1/pier_v1.1.1_darwin_arm64.tar.gz"
      sha256 "d5804788074e83f38906ff6e339a1339f850c5805a4fa878ef929bf5b8760d2c"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.1.1/pier_v1.1.1_darwin_amd64.tar.gz"
      sha256 "617ffab2b8d51ffe1348dc61094fe68276f0331677d35c6395eafd4c3888576e"
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
