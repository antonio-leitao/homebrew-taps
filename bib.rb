class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/v0.2.4/bib.tar.gz"
  sha256 "16f728945295069e9c66e12f273f0ad17a7d8db8c62d0d36554e6c2af1a0b57d"
  version "0.2.4"

  def install
    bin.install "bib"
  end
end
