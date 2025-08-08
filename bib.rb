class Bib < Formula
  desc "Academic paper manager with automatic BibTeX extraction and fuzzy search"
  homepage "https://github.com/antonio-leitao/bib"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.3/bib-x86_64-apple-darwin.tar.gz"
      sha256 "50535175cb56d5dc42e21069330095f81ee2e03cf476e3e83085c6b45b9a957d"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.3/bib-aarch64-apple-darwin.tar.gz"
      sha256 "af795b4f935d47b0c301f2ef36f23a53e71893953bfd9ecb96768400733b71b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/bib/releases/download/v0.5.3/bib-x86_64-linux.tar.gz"
      sha256 "c2b7ab4db31aeb2679c938881fc4a694ae6d4c226d92df9ced92009c9b791f61"
    end
  end

  depends_on "sqlite"

  def install
    # Install binary
    bin.install "bib"
    
    # Install shell completions
    bash_completion.install "completions/bib.bash"
    zsh_completion.install "completions/_bib"
    fish_completion.install "completions/bib.fish"
    
    # Install man page if it exists
    man1.install "bib.1" if File.exist?("bib.1")
    
    # Install documentation
    doc.install "README.md" if File.exist?("README.md")
    doc.install "CHANGELOG.md" if File.exist?("CHANGELOG.md")
  end

  def post_install
    # Create config directory
    (var/"bib").mkpath
  end

  def caveats
    <<~EOS
      Shell completions have been installed:
        Bash: #{HOMEBREW_PREFIX}/etc/bash_completion.d
        Zsh:  #{HOMEBREW_PREFIX}/share/zsh/site-functions
        Fish: #{HOMEBREW_PREFIX}/share/fish/vendor_completions.d

      For zsh, you may need to add the following to your ~/.zshrc:
        if type brew &>/dev/null; then
          FPATH="/share/zsh/site-functions:${FPATH}"
          autoload -Uz compinit && compinit
        fi

      To use the AI-powered BibTeX extraction, set your Gemini API key:
        export GEMINI_API_KEY="your-api-key"

      Get a free API key at: https://makersuite.google.com/app/apikey

      Database will be stored at: ~/.papers/papers.db
    EOS
  end

  test do
    # Test that the binary runs
    system "#{bin}/bib", "--version"
    
    # Test help command
    assert_match "Academic paper manager", shell_output("#{bin}/bib --help")
    
    # Test stats command (should work even with empty database)
    assert_match "Total papers", shell_output("#{bin}/bib stats")
  end
end
