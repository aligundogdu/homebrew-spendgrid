class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.0/spendgrid-darwin-amd64"
    sha256 "e7af31ded95ae897e1f0256b8c95e5fe62227bbb5a591755aeb237da4df56b46"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.0/spendgrid-darwin-arm64"
    sha256 "121abf0ee777c9ad18bc5f607b2d16c0cf43eb920be399447bc7b5742ed8bd04"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.0/spendgrid-linux-amd64"
    sha256 "c4624d3e88dfd45ae224f48f611c4dc7bf84bbcc28b30574c1a6b41b3b22f7f6"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.2.0 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.2.0 has been installed!
      
      New in v0.2.0:
        • Cobra CLI framework - better command structure
        • Real-time autocomplete for tags and projects
        • Interactive forms with keyboard input
        • Colorful financial reports
        • Automatic rule-transaction matching with #tag#
        • Plan command for budget tracking
      
      To get started:
        spendgrid init              # Initialize your database
        spendgrid --help           # Show all available commands
        spendgrid status           # Check database status
      
      Your data will be stored in: ~/.local/share/spendgrid
      
      For more information:
        https://github.com/aligundogdu/SpendGrid
    EOS
  end

  test do
    system "#{bin}/spendgrid", "version"
  end
end
