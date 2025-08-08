class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.9/bib-x86_64-apple-darwin.tar.gz"
      sha256 "5ae287c908649f8d060194b5bc9d01d0190c053b5c5b8d48ea94152d9d391530"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.9/bib-aarch64-apple-darwin.tar.gz"
      sha256 "118d558b1434f52da3f2360c78d0091c05fd7996f4eaa1141744234829c77c42"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.9/bib-x86_64-linux.tar.gz"
      sha256 "0c62b1b83c3ea616a0b1c1f9f1dd6fa9e6c8b1cef4d0941cab4b7db9bd9b8182"
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
