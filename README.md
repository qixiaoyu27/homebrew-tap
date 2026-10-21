# Mac Explorer · Homebrew

由 Mac Explorer 作者维护的 Homebrew Tap，直接安装 [官方 GitHub Release](https://github.com/qixiaoyu27/Mac-Explorer/releases/latest) 中的应用包，并校验 SHA-256。

## 安装

已安装 [Homebrew](https://brew.sh/) 的用户可以执行：

```sh
brew install --cask qixiaoyu27/tap/mac-explorer
```

应用支持 Apple Silicon（M 系列）、macOS 13 及以上；Homebrew 自身的系统支持要求以其官网为准。当前版本未经 Apple 公证，首次打开如被拦截，请确认来源后在「系统设置 → 隐私与安全性」中允许。若系统明确提示恶意软件，请勿继续运行。

若之前已通过 DMG 或脚本安装，Homebrew 会提示应用已存在；此时直接执行 `brew upgrade` 也会提示未安装。确认现有应用是当前正式版后，执行以下命令接管：

```sh
brew install --cask --adopt qixiaoyu27/tap/mac-explorer
```

`--adopt` 保留现有应用文件并登记 Homebrew 安装记录，不会更新应用版本。旧版本请先通过应用内更新或 DMG 升级；无需删除应用、个人文件或偏好设置，也不要使用 `--force` 强制覆盖。接管成功后才能使用下方的 Homebrew 更新命令。

Mac Explorer 的安装提示跟随 macOS 的语言偏好，支持简体中文、繁体中文和英文，未匹配时回退到英文；Homebrew 自身的日志由 Homebrew 控制。

## 更新与卸载

退出应用后更新：

```sh
brew update
brew upgrade --cask --greedy qixiaoyu27/tap/mac-explorer
```

`--greedy` 让 Homebrew 同时检查支持应用内更新的软件。也可以继续使用应用内更新。

卸载应用，保留偏好设置：

```sh
brew uninstall --cask mac-explorer
```

## 维护

每次 Mac Explorer 正式发布后，更新 `Casks/mac-explorer.rb` 中的 `version` 和 `sha256`。校验值必须来自实际下载的官方 ZIP，并与 Release 的 `SHA256SUMS-native.txt` 一致；不可使用 `:no_check`。安装包命名改变时同步更新 `url`。

```sh
brew style qixiaoyu27/tap/mac-explorer
brew audit --cask qixiaoyu27/tap/mac-explorer
brew livecheck --cask qixiaoyu27/tap/mac-explorer
brew fetch --cask qixiaoyu27/tap/mac-explorer
brew ruby tests/check-cask.rb
```

提交并推送后，用户通过 `brew update` 获取新版本定义。此仓库使用 Homebrew 标准更新流程，不会自动修改 Cask 版本。

反馈应用问题请前往 [Mac Explorer](https://github.com/qixiaoyu27/Mac-Explorer/issues)，安装渠道问题可在本仓库提交 Issue。
