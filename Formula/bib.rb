class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.5/bib-x86_64-apple-darwin.tar.gz"
      sha256 "a94aae2929b77da42f13fd4fd4f9891c95bcdceff0541954543be7e8bc04d9de"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.5/bib-aarch64-apple-darwin.tar.gz"
      sha256 "e902fe06aada80a678d2e4bc2331911d4ad1e6705fdb9789abffcce08e19c6e8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.5/bib-x86_64-linux.tar.gz"
      sha256 "558f3aaaa15ef3872ba94bfc5eadd768fc2ffdf25653d478ebaa7d9e48534577"
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
