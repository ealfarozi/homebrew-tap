# typed: false
# frozen_string_literal: true

class Ptb < Formula
  desc "PaperToBillion CLI — data saham BEI dari PTB di terminal"
  homepage "https://papertobillion.com/help?feature=ai-mcp"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.1/ptb_0.1.1_darwin_arm64.tar.gz"
      sha256 "15cad98091411e45725a0867c80fafc63fbfaffd03e695a5998f75e39725e848"
    else
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.1/ptb_0.1.1_darwin_amd64.tar.gz"
      sha256 "19cea44e529511f745506f68457d9dda272e89f1e63d73696af95888cc5b41d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.1/ptb_0.1.1_linux_arm64.tar.gz"
      sha256 "a6c0da13966ef200355c22746d457ad1904640b5eea6b6e1f802b5ebbc1abcd3"
    else
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.1/ptb_0.1.1_linux_amd64.tar.gz"
      sha256 "2b789ac55af96ee9fe52955fa5540d3a1b9e27df7a85cf5f495c17b4cbf6bf4c"
    end
  end

  def install
    bin.install "ptb"
    generate_completions_from_executable(bin/"ptb", "completion")
  end

  test do
    system "#{bin}/ptb", "version"
  end
end
