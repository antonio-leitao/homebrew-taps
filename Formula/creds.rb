class Creds < Formula
  desc "Secure, Git-backed credential manager with strong encryption"
  homepage "https://github.com/antonio-leitao/vault-rs"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.2.1/creds-x86_64-apple-darwin.tar.gz"
      sha256 "267b124f8236306922ef7e187e50447d6bbe5fe854373e8d5f6a6e1e19dfe6db"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.2.1/creds-aarch64-apple-darwin.tar.gz"
      sha256 "9e19d64f4f359f9933564c27c44dec1e278fd0388ed9638b3de9d16368e1c2ec"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.2.1/creds-x86_64-linux.tar.gz"
      sha256 "d4a38510ff0612be630658f01ab740ee5ae02d9b722e079024f7080699005aad"
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
