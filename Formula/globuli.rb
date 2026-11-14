# Globuli 0.5.34 (D-594, D-623). Written by tools/release/publish.sh in the
# Globuli repository; commit it as Formula/globuli.rb in globulus/homebrew-globuli.
class Globuli < Formula
  desc "Orchestrator that builds a product with coding agents"
  homepage "https://github.com/globulus/globuli-releases"
  url "https://github.com/globulus/globuli-releases/releases/download/v0.5.34/globuli-0.5.34-darwin-arm64.tar.gz"
  version "0.5.34"
  sha256 "14bad77004f7052ab942a21aec2d54fa71ccbaba4694eef2cbfd2b2404823dd2"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    # The bundle as it was unpacked, with its own Node; bin/globuli finds it
    # through the link.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/globuli"
  end

  def caveats
    <<~EOS
      Using Globuli needs the Owner's written permission (Globuli License 1.0,
      in #{libexec}/LICENSE). Then: globuli setup, which records it.
    EOS
  end

  test do
    assert_match "an install at", shell_output("#{bin}/globuli version")
  end
end
