class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.17/bib-x86_64-apple-darwin.tar.gz"
      sha256 "fab51074b8c065de2f0991f2dd0535dbbfc10174b1e9c633251f5a95731b3084"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.17/bib-aarch64-apple-darwin.tar.gz"
      sha256 "81b57d57b12e6957d61e41aa62a8133d8f04b0170f6d3ee7525daf14aa28436f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.17/bib-x86_64-linux.tar.gz"
      sha256 "2aedb38fff68a966ebde8d2e75739ac7249ce0fa9b57924bb121f6f121f0e19d"
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
