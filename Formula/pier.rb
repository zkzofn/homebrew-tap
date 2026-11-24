class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.4.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.4.0/pier_v1.4.0_darwin_arm64.tar.gz"
      sha256 "874c772d2ec7b06e3a6fbe1fc53dda64ecf3081fde3c7458538cb8bc5f381b36"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.4.0/pier_v1.4.0_darwin_amd64.tar.gz"
      sha256 "a768eedc302d32eb2a17763c5c7b741807d2efc5448f664fb3df28e1b5771924"
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
