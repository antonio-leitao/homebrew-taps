# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Nau < Formula
  desc "Modular project management tool."
  homepage "https://github.com/antonio-leitao/homebrew-taps"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antonio-leitao/nau/releases/download/v0.1.3/nau_Darwin_arm64.tar.gz"
      sha256 "56157165123abe9e9852c07dfa8ab3cfc675cb9759d5e42d95438969d60145a6"

      def install
        bin.install "nau"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/nau/releases/download/v0.1.3/nau_Darwin_x86_64.tar.gz"
      sha256 "48685b4640888695f5f020ebe0162fccc21dc2967ab1d27c6cf4da97237fc098"

      def install
        bin.install "nau"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/antonio-leitao/nau/releases/download/v0.1.3/nau_Linux_arm64.tar.gz"
      sha256 "bf82ebbaaade35773f99315b8f41f3ca56f44e81974e28eb44e5ebd6883a999b"

      def install
        bin.install "nau"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/antonio-leitao/nau/releases/download/v0.1.3/nau_Linux_x86_64.tar.gz"
      sha256 "618ed140493e25a564d862acd9b27f370ec082f70998ed9ce4bb2b89dd365a39"

      def install
        bin.install "nau"
      end
    end
  end
end
