class Creds < Formula
  desc "Secure, Git-backed credential manager with strong encryption"
  homepage "https://github.com/antonio-leitao/vault-rs"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.1.3/creds-x86_64-apple-darwin.tar.gz"
      sha256 "db33c4fcd549022ab53797afdfab315c3cbc3c3f74fd9353a0b73b3365ac8fe8"
    elsif Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.1.3/creds-aarch64-apple-darwin.tar.gz"
      sha256 "20fe9dec7a00b30169440ea5215d33028d583c90294cd4ad5b6192deb4464e3a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/vault-rs/releases/download/v0.1.3/creds-x86_64-linux.tar.gz"
      sha256 "9ef2db5394b097b06e96a7cfe6d911663b756f28560e9471d7f1bc75caa8192d"
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
