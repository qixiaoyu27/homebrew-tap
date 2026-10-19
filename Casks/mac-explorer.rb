cask "mac-explorer" do
  version "1.1.0"
  sha256 "2336b4987340a7cd8886048a971bfbb226aec24c70e065f586443c294bc7962b"

  url "https://github.com/qixiaoyu27/Mac-Explorer/releases/download/v#{version}/Mac-Explorer-Native-#{version}-mac-arm64.zip"
  name "Mac Explorer"
  desc "Native file manager with Windows Explorer workflows"
  homepage "https://github.com/qixiaoyu27/Mac-Explorer"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Mac Explorer.app"

  caveats <<~EOS
    感谢使用 Mac Explorer。

    如果它让你的日常文件管理更顺手，
    欢迎在 GitHub 点一颗 Star，支持项目继续完善：
    https://github.com/qixiaoyu27/Mac-Explorer

    Mac Explorer is not notarized by Apple.
    If macOS blocks opening it, review System Settings > Privacy & Security.
    Homebrew does not disable Gatekeeper or remove quarantine for this app.
  EOS
end
