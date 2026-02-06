class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.2.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.2/spendgrid-darwin-amd64"
    sha256 "03daa1a24870e820d1e82858a6a8712295b7e4f6265d5a5801b2157c7fcaa8dc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.2/spendgrid-darwin-arm64"
    sha256 "8a4fd0b174e6adf2d931d5ba3638e6134febcf701eaa58b2a14565da092acf8a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.2/spendgrid-linux-amd64"
    sha256 "1e440fafc6b8c3be6469e145a86828d6c1616ce459d71ccb735e5e1927895891"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.2.2 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.2.2 has been installed!
      
      What's new in v0.2.2:
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
