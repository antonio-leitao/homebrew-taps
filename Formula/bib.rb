class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.21/bib-x86_64-apple-darwin.tar.gz"
      sha256 "044779d7e0004a829e3faeb5cd3c25406cf81a0cbaddd3603473d20184ce82d5"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.21/bib-aarch64-apple-darwin.tar.gz"
      sha256 "8ca7ab59a04cbdba39d014a79d94a3309ab5fc414f8abe25d1be1244f90ccc70"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.21/bib-x86_64-linux.tar.gz"
      sha256 "1f648f435386c9a5db18f4119abd40745692793260d32c85ab891bc9dbb9d39d"
    end
  end

  def install
    # Install binary
    bin.install "bib"
    
    # Install docs
    doc.install "README.md" if File.exist?("README.md")
    doc.install "CHANGELOG.md" if File.exist?("CHANGELOG.md")
  end

  def post_install
    # Create config directory for database
    (var/"bib").mkpath
  end

  test do
    # Test that the binary runs
    assert_match "bib", shell_output("#{bin}/bib --version")
    
    # Test stats command (works even with empty database)
    assert_match "Total papers", shell_output("#{bin}/bib stats")
  end
end
