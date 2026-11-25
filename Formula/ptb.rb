# typed: false
# frozen_string_literal: true

class Ptb < Formula
  desc "PaperToBillion CLI — data saham BEI dari PTB di terminal"
  homepage "https://papertobillion.com/help?feature=ai-mcp"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.0/ptb_0.1.0_darwin_arm64.tar.gz"
      sha256 "8b016587ea74df74f087b2d1292f1ce64fe0a4cf51bb88a7c45ad51339c2402f"
    else
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.0/ptb_0.1.0_darwin_amd64.tar.gz"
      sha256 "36f48edf978d1e80a6c691ad590d10ff2eb4b1f12424507669924dd8b97129c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.0/ptb_0.1.0_linux_arm64.tar.gz"
      sha256 "b5d50f1c394b709a18dc5c0223230c6d65a9203a54ac1adb99652fa925a2b7b0"
    else
      url "https://github.com/ealfarozi/ptb-cli/releases/download/v0.1.0/ptb_0.1.0_linux_amd64.tar.gz"
      sha256 "f3c46a165a7783603ee4c1173b2d1f6da2399c3d24b2104ccdd3811317568d4d"
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
