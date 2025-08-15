class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.18/bib-x86_64-apple-darwin.tar.gz"
      sha256 "f40720873128f2bfe0e5897d4240f28ef2dffbfa59170d8c88a82d10075743e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.18/bib-aarch64-apple-darwin.tar.gz"
      sha256 "6d7118c2dfa68c5b62442bec1fb4d508f091d403f37bed781798fce9437e962e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.18/bib-x86_64-linux.tar.gz"
      sha256 "3cfe14ddc8cfab66a5e352227196c6d94cf38b80b3f4e0f6d1c6aa9d017e2068"
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
