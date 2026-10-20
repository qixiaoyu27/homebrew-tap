cask "mac-explorer" do
  version "1.2.0"
  sha256 "51aad701ea161780f9807af3080e80a324bd4f65765096a50728d9b81aba8cfb"

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
