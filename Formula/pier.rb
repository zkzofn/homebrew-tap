class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.2.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.2.0/pier_v1.2.0_darwin_arm64.tar.gz"
      sha256 "6349adfe34f7c9665fbd1d18ef4613daa552145e6559153a9dc19223d9b1bd48"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.2.0/pier_v1.2.0_darwin_amd64.tar.gz"
      sha256 "90ccada80b84963b9f6025744ff1e22c46f2fc726a9ae258193381cddb8de774"
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
