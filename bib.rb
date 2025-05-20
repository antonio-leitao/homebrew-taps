class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/v0.4.0/bib.tar.gz"
  sha256 "2bc8ffe95807fcf8bde61243e2118fedb3f00bc56468ba37cf6ce350fd6ff5d9"
  version "0.4.0"

  def install
    bin.install "bib"
  end
end
