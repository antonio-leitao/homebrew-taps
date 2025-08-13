class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.16/bib-x86_64-apple-darwin.tar.gz"
      sha256 "ba4442d1f7e179795901a4202da3d758dd9cc1dadb86787cd553b020c5408c44"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.16/bib-aarch64-apple-darwin.tar.gz"
      sha256 "8d7f4c2c29d5f2f99891568c237e1aa4fc5d8abf851fc4e1ef16bcb0074ccbd0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.16/bib-x86_64-linux.tar.gz"
      sha256 "fc85f0f32c21a69b3a8f78b3732e7821fd04b68f9aaf8eaee78c5dfb227e2bb7"
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
