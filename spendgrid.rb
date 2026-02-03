class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.1.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.9/spendgrid-darwin-amd64"
    sha256 "eac52551ab5444e9c2d7d6c1ce4a86d000ede0ab8f027d974282f9f3e548221b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.9/spendgrid-darwin-arm64"
    sha256 "34ec48b7527dfbf837be674c0365c06eed01193d8aa6cc43bf817d64abac1f95"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.9/spendgrid-linux-amd64"
    sha256 "ff010f17cb1bce4eefed0d9207033a0921ea9e6d4939303cc45a713c80717f49"
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