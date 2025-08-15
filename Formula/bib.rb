class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.20/bib-x86_64-apple-darwin.tar.gz"
      sha256 "c7c50037e3c893328f9376a2e4d272a333157867dc1d0aeede7205be7715eb55"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.20/bib-aarch64-apple-darwin.tar.gz"
      sha256 "9f4c805d785e35db63c36e26a2d93c06dc644751cadda52b70e8bdc30fc583f1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.20/bib-x86_64-linux.tar.gz"
      sha256 "ce0a21096d92b2909091a572c462fb82241fd9ba7848a63b066d68a334866ec4"
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
