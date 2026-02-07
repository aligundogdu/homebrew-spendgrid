class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.2.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.4/spendgrid-darwin-amd64"
    sha256 "a4bcbea2935540a4877ccbbd19acbc1c10eb64db320c9d09557a5b5d14546a55"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.4/spendgrid-darwin-arm64"
    sha256 "fab523883535879e857cef72e5f364dcc20414be0b210906c0d0967283faefe5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.2.4/spendgrid-linux-amd64"
    sha256 "42cb87f0a0b564d9f533febc286633ed3f8816f8003348ffb4a2d0a318cd2160"
  end

  def install
    bin.install Dir["spendgrid-*"].first => "spendgrid"
  end

  def post_install
    ohai "SpendGrid v0.2.4 installed! Run 'spendgrid init' to get started."
  end

  def caveats
    <<~EOS
      SpendGrid v0.2.4 has been installed!
      
      What's new in v0.2.4:
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
