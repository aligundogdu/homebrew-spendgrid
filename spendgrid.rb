class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.2.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.6/spendgrid-darwin-amd64"
    sha256 "d3b713682400157f12f40cb2330138c1ad687ab09a01e32918282028066c2d4f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.6/spendgrid-darwin-arm64"
    sha256 "ddc9958e308e2992a65e621055e72434536506be3ca6f815856429a403c9b38e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.6/spendgrid-linux-amd64"
    sha256 "6cfd02a4ca7ecdd5e79f1923ea0ff04379348e45d8b59429e64eb9b3d07b57b6"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.2.6 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.2.6 has been installed!
      
      What's new in v0.2.6:
        • Bug fixes and improvements
      
      What's new in v0.2.5:
        • Bug fixes and improvements
      
      What's new in v0.2.3:
        • Rule completion system - track planned vs actual with [ ] → [x]
        • New commands: complete, uncomplete, complete-month
        • Three-section reports: Actual, Planned, and Projection
        • Space support in interactive inputs (descriptions, names)
        • Comprehensive documentation (TR/EN) with 73+ examples
      
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
