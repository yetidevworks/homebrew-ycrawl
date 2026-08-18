class Ycrawl < Formula
  desc "Fetch a web page, get clean markdown, with honest verdicts when a page is walled"
  homepage "https://github.com/yetidevworks/ycrawl"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.0/ycrawl-0.2.0-darwin-arm64.tar.gz"
      sha256 "017a8f58a7b07341706ea2be07da62715099f17362d2e13cfa05b77a29deef76"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.0/ycrawl-0.2.0-darwin-x86_64.tar.gz"
      sha256 "c18abfbeb697ca9d6d944df00acb4ada34147ebcca6f4b339c2fd31439d686fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.0/ycrawl-0.2.0-linux-aarch64.tar.gz"
      sha256 "ea831c5767761d12a17b951b5868a26eb74cb34b3804c1a7755c3884f81bdf78"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.0/ycrawl-0.2.0-linux-x86_64.tar.gz"
      sha256 "642419b547abec1868e128601738c68a311b67cb948f2aff3ef6ed4ad0f8fda3"
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
