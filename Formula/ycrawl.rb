class Ycrawl < Formula
  desc "Fetch a web page, get clean markdown, with honest verdicts when a page is walled"
  homepage "https://github.com/yetidevworks/ycrawl"
  version "0.1.0-rc.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.1.0-rc.1/ycrawl-0.1.0-rc.1-darwin-arm64.tar.gz"
      sha256 "25b7487bc1e610a958e6936bddbca7b08afcae1ce1e25e2e1b2b6fde82f6a587"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.1.0-rc.1/ycrawl-0.1.0-rc.1-darwin-x86_64.tar.gz"
      sha256 "e8b1fe9b018a14920eb4ae278aa6687e7bb661312ef6bebee9c9edd541a7d4cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.1.0-rc.1/ycrawl-0.1.0-rc.1-linux-aarch64.tar.gz"
      sha256 "e6355a9178ea1ccb7d42c894e57c6fe0833d72320154d91a35293c8b1a7e09bf"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.1.0-rc.1/ycrawl-0.1.0-rc.1-linux-x86_64.tar.gz"
      sha256 "ceb0598681c977c1eb92ed6a6a296f76470123be92325b76f758cf7941cd9009"
    end
  end

  def install
    bin.install "ycrawl"
  end

  def caveats
    <<~EOS
      ycrawl fetches over HTTP by default and needs nothing else.

      To let it fall back to a real browser for JavaScript-rendered pages and
      Cloudflare interstitials, also install:

        brew install geckodriver

      plus Firefox. Without them ycrawl still works and reports why it could
      not escalate.
    EOS
  end

  test do
    assert_match "ycrawl", shell_output("#{bin}/ycrawl --version")
  end
end
