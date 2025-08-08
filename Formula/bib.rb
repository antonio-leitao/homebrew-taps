class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.14/bib-x86_64-apple-darwin.tar.gz"
      sha256 "2fad830e43210c971a0743ed1feee03461057e8c38c1c7b8769c898ea91e909a"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.14/bib-aarch64-apple-darwin.tar.gz"
      sha256 "9bbefe4778eaad550305452728f4f3222efffa2cfa2a5594c12a485e92095b7e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.14/bib-x86_64-linux.tar.gz"
      sha256 "c9908a4ee6c13ff6d8cb6fe48586626943a5c5edd1309a004d144e153e0beab7"
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
