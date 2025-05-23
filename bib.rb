class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/v0.4.1/bib.tar.gz"
  sha256 "f7cd7b72955e75d369adfa11cd8f71a76b47de7fbb14ea28549dab57078462dc"
  version "0.4.1"

  def install
    bin.install "bib"
  end
end
