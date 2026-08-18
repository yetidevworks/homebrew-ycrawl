class Ycrawl < Formula
  desc "Fetch a web page, get clean markdown, with honest verdicts when a page is walled"
  homepage "https://github.com/yetidevworks/ycrawl"
  version "REPLACE_VERSION"
  license "MIT"

  on_macos do
    on_arm do
      url "REPLACE_DARWIN_ARM64_URL"
      sha256 "REPLACE_DARWIN_ARM64_SHA"
    end
    on_intel do
      url "REPLACE_DARWIN_X86_64_URL"
      sha256 "REPLACE_DARWIN_X86_64_SHA"
    end
  end

  on_linux do
    on_arm do
      url "REPLACE_LINUX_AARCH64_URL"
      sha256 "REPLACE_LINUX_AARCH64_SHA"
    end
    on_intel do
      url "REPLACE_LINUX_X86_64_URL"
      sha256 "REPLACE_LINUX_X86_64_SHA"
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
