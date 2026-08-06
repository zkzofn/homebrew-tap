class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  version "0.9.0"
  license "MIT"

  depends_on "tmux"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zkzofn/pier/releases/download/v0.9.0/pier_v0.9.0_darwin_arm64.tar.gz"
      sha256 "924d8481f60ed2c6f5c099a484072cd6e73c1e197a2b1cc3e727e4f4bf9af4d6"
    else
      url "https://github.com/zkzofn/pier/releases/download/v0.9.0/pier_v0.9.0_darwin_amd64.tar.gz"
      sha256 "ededa9f4ec375ec19e561ca36fd2e996f150d1b853b93f55a8a5d4ba531d2082"
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
