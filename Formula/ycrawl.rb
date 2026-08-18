class Ycrawl < Formula
  desc "Fetch a web page, get clean markdown, with honest verdicts when a page is walled"
  homepage "https://github.com/yetidevworks/ycrawl"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.1/ycrawl-0.2.1-darwin-arm64.tar.gz"
      sha256 "f0c87f36c470d595cdec5fa895f239d6096f1f1539d50ec7805c13d181309153"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.1/ycrawl-0.2.1-darwin-x86_64.tar.gz"
      sha256 "b02776b034eacd08302cad8f950ecabb96bbb05d1e21c27fdd54c3f5c81dd2ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.1/ycrawl-0.2.1-linux-aarch64.tar.gz"
      sha256 "6af4968f27c7334fb959402d17b8217d1ec5e116e5fb9ea088544f4dfeeae16b"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v0.2.1/ycrawl-0.2.1-linux-x86_64.tar.gz"
      sha256 "78e3751edf7678f6ff989f6babd8563e612b4b4e6975b37f93656227320fa2e7"
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
