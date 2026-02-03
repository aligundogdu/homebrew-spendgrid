class Spendgrid < Formula
  desc "Financial Projection and Cash Flow Management CLI Tool"
  homepage "https://github.com/aligundogdu/SpendGrid"
  version "0.1.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.3/spendgrid-darwin-amd64"
    sha256 "5db07d27af1515333541ca0e52355f46bcb3d88872b3ffe7386541bde1e6897b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.3/spendgrid-darwin-arm64"
    sha256 "0844c32de21c7bc7edd90256339e3fa1c61d1cb621c65b55000a09552a2c4d95"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aligundogdu/SpendGrid/releases/download/v0.1.3/spendgrid-linux-amd64"
    sha256 "57c7a2a99d568cf52a88868dc86e61b7f68132ca8cd24ecbee7e5159c60bdfd6"
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