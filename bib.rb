class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/v0.1.1/bib.tar.gz"
  sha256 "fd0181b3f211b51a85a39e91b1cf616f745d84e6bf95da43ccdbad54c8c23c4c"
  version "0.1.1"

  def install
    bin.install "bib"
  end
end
