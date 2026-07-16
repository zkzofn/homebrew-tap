class Pier < Formula
  desc "Tmux sidebar dashboard for Claude Code sessions"
  homepage "https://github.com/zkzofn/pier"
  url "https://github.com/zkzofn/pier/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f48307f29a76c1b73709b414b34c5fdf821edc90b65601f7a4e1ed7a760b5bef"
  license "MIT"
  head "https://github.com/zkzofn/pier.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pier version")
  end
end
