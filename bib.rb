class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/0.1.0/bib.tar.gz"
  sha256 "e6e5723a8d521ddab73a1e97f44114e69dfbb8a5839fb1678df779675fc8d60e"
  version "0.1.0"

  def install
    bin.install "bib"
  end
end
