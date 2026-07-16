class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "0.3.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v0.3.0/pier_v0.3.0_darwin_arm64.tar.gz"
      sha256 "6d47374943137a9aa710f26a5dee2973d2e3cff8c40be2ec018a40f6ea66ebe6"
    else
      url "https://github.com/zkzofn/pier/releases/download/v0.3.0/pier_v0.3.0_darwin_amd64.tar.gz"
      sha256 "e38a4ba8176219c79552218504dd60ed730bdd9867b7f8ab7e3504d9893c11dc"
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
