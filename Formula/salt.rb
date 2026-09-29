class Salt < Formula
  desc "Encrypts AI agent memory backups before they reach Git"
  homepage "https://github.com/spicy-lemonade/salt"
  url "https://github.com/spicy-lemonade/salt/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "49c5c8c0c724d91de31c788669bd01562b7343e2779f16da851e5b72c1d90498"
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
