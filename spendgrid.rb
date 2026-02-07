class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.2.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.3/spendgrid-darwin-amd64"
    sha256 "764ddf08b1dbdf55315f4481dd20dec26797b9dd6d68275ee2c01926ea211bae"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.3/spendgrid-darwin-arm64"
    sha256 "4b9f081316a89022ad600fa60b4ce0ae9d65b13b4be0d3287254a097e83c75e8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.3/spendgrid-linux-amd64"
    sha256 "f6217a77e5de131fa8f24591809295ae81f81b25f9a82892709617f21d1e94c8"
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
