class Creds < Formula
  desc "Secure, Git-backed credential manager with strong encryption"
  homepage "https://github.com/antonio-leitao/vault-rs"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.2.0/creds-x86_64-apple-darwin.tar.gz"
      sha256 "4af3f8f61ebc4c05a811f2b4be3ad8fa307e5c9cbca80228b09421a3e8942212"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.2.0/creds-aarch64-apple-darwin.tar.gz"
      sha256 "75e2bf77b5873811ee45c33deb219c239bef1ac7461f0b96ac0e5fe3c1d95c8d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.2.0/creds-x86_64-linux.tar.gz"
      sha256 "78674276b1fb7b607867f369262cdc3fac7a28f11dae487a75317113d0fc6bd5"
    end
  end

  depends_on "git"

  def install
    bin.install "creds"
    
    # Install shell completions if they exist
    if File.exist?("completions/creds.bash")
      bash_completion.install "completions/creds.bash"
    end
    
    if File.exist?("completions/creds.zsh")
      zsh_completion.install "completions/_creds"
    end
    
    if File.exist?("completions/creds.fish")
      fish_completion.install "completions/creds.fish"
    end
  end

  test do
    # Test that the binary runs
    system "#{bin}/creds", "--version"
    
    # Test help command
    assert_match "A secure, Git-backed secret manager", shell_output("#{bin}/creds --help")
  end
end
