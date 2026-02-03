class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.1.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.1/spendgrid-darwin-amd64"
    sha256 "502d33339abacd44d37aa8aadf89ecea9aa5ec6c4284d47b2a1d5b71ccf2d320"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.1/spendgrid-darwin-arm64"
    sha256 "2147812d0e4a6759499c3fafe6152b7dd915d3ba593a3d0a8f5e5e37d9e5c7b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.1/spendgrid-linux-amd64"
    sha256 "4f6f84706ecb4e1a6610ed676875607ab414e5096e0378bcf6bef937c3643107"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid installed! Run 'spendgrid init' to get started."
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