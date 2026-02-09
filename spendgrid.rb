class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.3.0/spendgrid-darwin-amd64"
    sha256 "ad7873515050f03cbcd88dbb1cad855a0168f18fc405178dfc7df300b04eaebb"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.3.0/spendgrid-darwin-arm64"
    sha256 "1dc131f5b6c0c13c1fd07bb956522923f95558fcda79efbac3ce428c0dd3e07a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.3.0/spendgrid-linux-amd64"
    sha256 "aa687b425372be13ec932915c8668b66832d2fca64cbb7eaa9d97c3f573e2b8e"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.3.0 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.3.0 has been installed!
      
      What's new in v0.3.0:
        • Budget tags with % prefix - track annual spending budgets
        • New command: spendgrid budget - detailed budget reports
        • Budget integration in monthly/yearly reports
        • Annual budget tracking with projections and warnings
        • Centralized tag normalization system
      
      What's new in v0.2.6:
        • Bug fixes and improvements
      
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
