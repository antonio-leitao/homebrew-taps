class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/v0.3.0/bib.tar.gz"
  sha256 "42c623dc5beffa2cefefb4db8e206e46b02ee4ca8425d82cc0f36fb1a1076383"
  version "0.3.0"

  def install
    bin.install "bib"
  end
end
