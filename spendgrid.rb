class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.1.0"
  license "MIT"

  # macOS Intel
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.0/spendgrid-darwin-amd64"
    sha256 "c096dc3eb210e2eb53b5b75d6477946b52b05155bc3e6732748ab9dfefe6b2d0"
  end

  # macOS Apple Silicon
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.0/spendgrid-darwin-arm64"
    sha256 "e6f003e68277c28fc0f809585977a79dbea9edb8026f74f1cd4038158b32b8f9"
  end

  # Linux
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.0/spendgrid-linux-amd64"
    sha256 "475e78fef9ea6c520fab0e5a569ec7119355ba1f4b87ee60bb9a57472641a62a"
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