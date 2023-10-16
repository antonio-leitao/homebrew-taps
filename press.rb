class Press < Formula
  desc "A command line printing press for latex."
  homepage "https://github.com/antonio-leitao/printing-press"
  url "https://github.com/antonio-leitao/printing-press/releases/download/v0.1.0/press-0.1.0-x86_64-apple-darwin.tar.gz"
  sha256 "d2bec87e6b5d1b51630b4eae73466eb99ee9c6db"
  version "0.1.0"

  def install
    bin.install "press"
  end
end
