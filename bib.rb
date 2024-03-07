class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/v0.2.4/bib.tar.gz"
  sha256 "46a5f0d2322f065e46537b70df626a7e7e04904d592b52c66be9cbb47211e28a"
  version "0.2.4"

  def install
    bin.install "bib"
  end
end
