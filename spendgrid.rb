class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.1.0"
  license "MIT"

  # macOS Intel
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.0/spendgrid-darwin-amd64"
    sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
  end

  # macOS Apple Silicon
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.0/spendgrid-darwin-arm64"
    sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
  end

  # Linux
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.0/spendgrid-linux-amd64"
    sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def caveats
    <<~EOS
      SpendGrid has been installed!
      
      To get started:
        spendgrid init              # Initialize your database
        spendgrid --help          # Show all available commands
        spendgrid status          # Check database status
      
      Your data will be stored in: ~/.local/share/spendgrid
      
      For more information:
        https://github.com/aligundogdu/SpendGrid
    EOS
  end

  test do
    system "#{bin}/spendgrid", "version"
  end
end