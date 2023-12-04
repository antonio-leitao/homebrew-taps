class Press < Formula
  desc "A command line printing press for latex."
  homepage "https://github.com/antonio-leitao/printing-press"
  url "https://github.com/antonio-leitao/printing-press/releases/download/v0.1.1/press.tar.gz"
  sha256 "035c1eed851eb4462dcbbfb5b8581ee4bcfd332328186d73951952b42ee67abf"
  version "0.1.1"

  def install
    bin.install "press"
  end
end
