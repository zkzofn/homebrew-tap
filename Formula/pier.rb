class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "0.3.2"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v0.3.2/pier_v0.3.2_darwin_arm64.tar.gz"
      sha256 "3d63802575a843edb96ed7a6d871823704d7087e9c7d75eae8c5d748e910dc1d"
    else
      url "https://github.com/zkzofn/pier/releases/download/v0.3.2/pier_v0.3.2_darwin_amd64.tar.gz"
      sha256 "647b7f040c8d861b282b1565dc5d9ea3ed0110bae874bce715936732e8f76b79"
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
