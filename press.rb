class Press < Formula
  desc "A command line printing press for latex."
  homepage "https://github.com/antonio-leitao/printing-press"
  url "https://github.com/antonio-leitao/printing-press/releases/download/v0.1.0/press-0.1.0-x86_64-apple-darwin.tar.gz"
  sha256 "34bd3a730d6aa108574ae16a09c27e1ed4539ea352665a548269dbd6cd3fb4e"
  version "0.1.0"

  def install
    bin.install "press"
  end
end
