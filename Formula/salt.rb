class Salt < Formula
  desc "Encrypts AI agent memory backups before they reach Git"
  homepage "https://github.com/spicy-lemonade/salt"
  url "https://github.com/spicy-lemonade/salt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "05f9d4f7125fa4f8a708469b49726415509660861677275be08c2504edfe7f29"
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
