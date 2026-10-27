cask "mac-explorer" do
  version "1.5.2"
  sha256 "57d5cc81d36a12e21e4afcb5d9f67b05524876ad9c83ae925af815ca4080c4c5"

  language "zh-Hans" do
    "zh-Hans"
  end
  language "zh-Hant" do
    "zh-Hant"
  end
  language "zh-TW", "zh-HK", "zh-MO" do
    "zh-Hant"
  end
  language "zh" do
    "zh-Hans"
  end
  language "en", default: true do
    "en"
  end

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

  caveats do
    case language
    when "zh-Hans"
      <<~EOS
        感谢使用 Mac Explorer。
        如果它让你的日常文件管理更顺手，欢迎在 GitHub 点一颗 🌟 Star：
        https://github.com/qixiaoyu27/Mac-Explorer

        Mac Explorer 尚未经过 Apple 公证。
        若 macOS 阻止打开，请检查「系统设置 → 隐私与安全性」。
        Homebrew 不会关闭 Gatekeeper 或移除此应用的下载隔离标记。
      EOS
    when "zh-Hant"
      <<~EOS
        感謝使用 Mac Explorer。
        如果它讓你的日常檔案管理更順手，歡迎在 GitHub 點一顆 🌟 Star：
        https://github.com/qixiaoyu27/Mac-Explorer

        Mac Explorer 尚未經過 Apple 公證。
        若 macOS 阻止開啟，請檢查「系統設定 → 隱私權與安全性」。
        Homebrew 不會關閉 Gatekeeper 或移除此應用程式的下載隔離標記。
      EOS
    else
      <<~EOS
        Thank you for using Mac Explorer.
        If it makes your everyday file management easier, consider giving it a 🌟 Star on GitHub:
        https://github.com/qixiaoyu27/Mac-Explorer

        Mac Explorer is not notarized by Apple.
        If macOS blocks opening it, review System Settings > Privacy & Security.
        Homebrew does not disable Gatekeeper or remove quarantine for this app.
      EOS
    end
  end
end
