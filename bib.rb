class Bib < Formula
  desc "A command line bibliography manager."
  homepage "https://github.com/antonio-leitao/bib"
  url "https://github.com/antonio-leitao/bib/releases/download/v0.2.2/bib.tar.gz"
  sha256 "ac80efe05b140a589ff4ea592234bfa595966ef60a0b89c6a1989f85841f646f"
  version "0.2.2"

  def install
    bin.install "bib"
  end
end
