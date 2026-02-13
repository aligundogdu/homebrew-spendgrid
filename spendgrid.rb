class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.3.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.3.1/spendgrid-darwin-amd64"
    sha256 "2ac98f43de169de846682c604282bb98cf3471be5b1c37b31c06adfb8a033484"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.3.1/spendgrid-darwin-arm64"
    sha256 "e63a6eb4c18550ea56f0d9e876c7928ddf0cc0910c68b4c27ae744b0dfa49788"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.3.1/spendgrid-linux-amd64"
    sha256 "7361d9c8895b365ebc7fe02fc2f1ac5cbd7ef7325691315cf007ca4c275cf4a1"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.3.1 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.3.1 has been installed!
      
      What's new in v0.3.1:
        • Fixed report commands hanging issue
        • Fixed double prefix (@@) normalization
        • Fixed currency code standardization
        • Added HTTP timeout for API calls
      
      What's new in v0.3.0:
        • Budget tags with % prefix - track annual spending budgets
        • New command: spendgrid budget - detailed budget reports
        • Budget integration in monthly/yearly reports
        • Annual budget tracking with projections and warnings
      
      To get started:
        spendgrid init              # Initialize your database
        spendgrid --help           # Show all available commands
        spendgrid status           # Check database status
      
      Budget Tracking Example:
        spendgrid rules add         # Create rule with %bes tag
        spendgrid add "-10000 BES #bes %bes"
        spendgrid budget %bes       # View budget status
      
      Your data will be stored in: ~/.local/share/spendgrid
      
      For more information:
        https://github.com/aligundogdu/SpendGrid
    EOS
  end

  test do
    system "#{bin}/spendgrid", "version"
  end
end
