class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "1.3.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v1.3.0/pier_v1.3.0_darwin_arm64.tar.gz"
      sha256 "04ed426d08eb5c7f29241a45fbc7e41e40775957155076c09ec0e6ddc41e9384"
    else
      url "https://github.com/zkzofn/pier/releases/download/v1.3.0/pier_v1.3.0_darwin_amd64.tar.gz"
      sha256 "a5d96b081644536397ba4ae3799324ce7473365d8287851d47ec20a0e9dd02aa"
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
