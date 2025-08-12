class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.15/bib-x86_64-apple-darwin.tar.gz"
      sha256 "2546a0080031fdffad2eee48610ff05c5d40b3e82f207e7e62890915227bf532"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.15/bib-aarch64-apple-darwin.tar.gz"
      sha256 "077579abd9af1ad200030d735d395057888ebcda42c75c4a8c3f6e684bd0d2cc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.15/bib-x86_64-linux.tar.gz"
      sha256 "f8cfc685a3fc90c03e5a517f6ae16edf960c08f3a95f854d9b144d83c8e5284e"
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
