class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.1.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.10/spendgrid-darwin-amd64"
    sha256 "5e7e5d9968bf9ac69bb131cfe291e9d3c72bcdeabb5e6aa1626a4324420c5c2d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.10/spendgrid-darwin-arm64"
    sha256 "a7db7768ddff59287592d8a226ef426def3b3b2ecae31f4a4396a0e2efed158c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.10/spendgrid-linux-amd64"
    sha256 "b41cf78a92ec2596bfb27112441b962f29a223b6f1763c9e2971554c9defa84f"
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