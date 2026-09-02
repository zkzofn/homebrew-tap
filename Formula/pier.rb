class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.3.1"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.3.1/pier_v1.3.1_darwin_arm64.tar.gz"
      sha256 "79d88c8bc14f2e4bd9d53131be2dbe5414731b1ec743b305eb04254f481c93f1"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.3.1/pier_v1.3.1_darwin_amd64.tar.gz"
      sha256 "cdd2ef531111125b4c57464ea01ae8ca790367fb1e4356a9b698efb800acfb2b"
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
