class Salt < Formula
  desc "Encrypts AI agent memory backups before they reach Git"
  homepage "https://github.com/spicy-lemonade/salt"
  url "https://github.com/spicy-lemonade/salt/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "85773953aeee2fa7bee3ec14e9bcfaf4b8d12d403fb8c0f7ab503d7a7c72f95f"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/salt"
  end

  test do
    assert_match "salt #{version}", shell_output("#{bin}/salt version")
  end
end
