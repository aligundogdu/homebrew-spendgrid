class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.2.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.1/spendgrid-darwin-amd64"
    sha256 "1f13038a63544b27c9095afc14caef6774825bdac4096b52cb0ebec647c607e2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.1/spendgrid-darwin-arm64"
    sha256 "c363d35965a2a37803f5f0da26f59022db675e8e1ff5b64c42d78177a4718e1e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.1/spendgrid-linux-amd64"
    sha256 "51bfb1c2589bfad5144907c430c07f5a18cb6ecb0408a6f85f9039d2562456ef"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.2.1 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.2.1 has been installed!
      
      What's new in v0.2.1:
        • Fixed amount parsing for various formats (250000TL, 25.000,50, etc.)
      
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
