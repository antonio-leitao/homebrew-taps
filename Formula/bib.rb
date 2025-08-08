class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.13/bib-x86_64-apple-darwin.tar.gz"
      sha256 "4f1b095dbdbedee1e11f2453e97b0c9eef41d956fabf2e530ef9b4831c9dbfde"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.13/bib-aarch64-apple-darwin.tar.gz"
      sha256 "6020dc43641f3bb32514a473ee668d2a193987ae3ba738bf74a62bd09d6dd09e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.13/bib-x86_64-linux.tar.gz"
      sha256 "586739f0707c1c711a64d07cac60cc3e802a31aa6293a31cf4883327086977dd"
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
