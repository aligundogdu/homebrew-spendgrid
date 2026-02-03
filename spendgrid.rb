class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.1.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.6/spendgrid-darwin-amd64"
    sha256 "76d48420ffd65bdd95cd66858b55d79a044f1ce07ae17f8a25102f876ac9185f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.6/spendgrid-darwin-arm64"
    sha256 "7aca094896c9cbe7a6d141f20f7cda332de82090b06bd70f78977242f4ad1246"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.6/spendgrid-linux-amd64"
    sha256 "5bdbf87163f015b9e1a723c9289d3809638fde585ae8f7fd9e78d281a6d01307"
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