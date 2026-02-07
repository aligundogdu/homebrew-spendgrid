class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.2.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.3/spendgrid-darwin-amd64"
    sha256 "c26e5d345dacedad9f8604e956b73c38b3ba4884167d3df778e0616a3a1f8485"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.3/spendgrid-darwin-arm64"
    sha256 "02696912384ffcea0c6ae8f5c243bdb3690aa683bfe9b7f3cf41d9c9b7ca3ae8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.3/spendgrid-linux-amd64"
    sha256 "24e252bfbb564c8e4fd62c13332c3192531718ef94b8b074a5fc187cc04c66be"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.2.3 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.2.3 has been installed!
      
      What's new in v0.2.3:
        • Rule completion system - track planned vs actual with [ ] → [x]
        • New commands: complete, uncomplete, complete-month
        • Three-section reports: Actual, Planned, and Projection
        • Space support in interactive inputs (descriptions, names)
        • Comprehensive documentation (TR/EN) with 73+ examples
      
      New in v0.2.2:
        • Fixed amount parsing in rules add command
        • Supports combined amount+currency format (25000TRY, 500 USD)
      
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
