class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.12/bib-x86_64-apple-darwin.tar.gz"
      sha256 "e207ac7fd67a97815f2645f3a973e88cf2e77c93708f3f53281aa806944405b2"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.12/bib-aarch64-apple-darwin.tar.gz"
      sha256 "38e67aaf979ea74f7069666009d75b877f74c5b9fa2d679fade8b76dfaaf2591"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.12/bib-x86_64-linux.tar.gz"
      sha256 "fca48d8620c609484aeb0781140e5e6c89a637c5a8d02317dd7ee969ddbb8d18"
    end
  end

  def install
    # Install binary
    bin.install "bib"
    
    # Install completions - Homebrew handles the rest automatically
    bash_completion.install "completions/bib.bash" => "bib"
    zsh_completion.install "completions/_bib" => "_bib"
    fish_completion.install "completions/bib.fish" => "bib.fish"
    
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
