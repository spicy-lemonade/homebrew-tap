class Salt < Formula
  desc "Encrypts AI agent memory backups before they reach Git"
  homepage "https://github.com/spicy-lemonade/salt"
  url "https://github.com/spicy-lemonade/salt/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "10e3ca07b462fc6c11265d9f585f788e2e06aadcc4e758fc55fb467f125a80eb"
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
