class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.4.1"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.4.1/pier_v1.4.1_darwin_arm64.tar.gz"
      sha256 "8e208816d66c865c667659d3608270f5af99ad0504f7f090ca5ff9dec6df94c1"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.4.1/pier_v1.4.1_darwin_amd64.tar.gz"
      sha256 "1c0883e108ea41141c55af79c3e891591aa6006bb51b0192d9fd672626788931"
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
