class Ycrawl < Formula
  desc "Fetch a web page, get clean markdown, with honest verdicts when a page is walled"
  homepage "https://github.com/yetidevworks/ycrawl"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v1.0.0/ycrawl-1.0.0-darwin-arm64.tar.gz"
      sha256 "14d10a11377aa88f2d3646df21e57ddbc17c3961510b67953b7eb8c888d61a4b"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v1.0.0/ycrawl-1.0.0-darwin-x86_64.tar.gz"
      sha256 "690e38c6c62b10688aac609e93af3ccdc36cb31b0e77368bc9e96271c85ade46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v1.0.0/ycrawl-1.0.0-linux-aarch64.tar.gz"
      sha256 "bc78b65bb3b86387e393e0b5929258ecaba7325c8544a2e98d6e29fbaf40ae62"
    end
    on_intel do
      url "https://github.com/yetidevworks/ycrawl/releases/download/v1.0.0/ycrawl-1.0.0-linux-x86_64.tar.gz"
      sha256 "1f334b4187e0db62515f332e0c965ba0d9069f71e3eb9678d9ebc7cd599a0345"
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
