# typed: strict
# frozen_string_literal: true

# Run with: brew ruby tests/check-cask.rb
require "cask/cask_loader"

cask_path = Pathname(__dir__).parent/"Casks/mac-explorer.rb"
cases = {
  ["zh-Hans-CN"]       => ["zh-Hans", "感谢使用", "隐私与安全性"],
  ["zh-Hans-TW"]       => ["zh-Hans", "感谢使用", "隐私与安全性"],
  ["zh-CN"]            => ["zh-Hans", "感谢使用", "隐私与安全性"],
  ["zh-SG"]            => ["zh-Hans", "感谢使用", "隐私与安全性"],
  ["zh-Hant-TW"]       => ["zh-Hant", "感謝使用", "隱私權與安全性"],
  ["zh-Hant-CN"]       => ["zh-Hant", "感謝使用", "隱私權與安全性"],
  ["zh-TW"]            => ["zh-Hant", "感謝使用", "隱私權與安全性"],
  ["zh-HK"]            => ["zh-Hant", "感謝使用", "隱私權與安全性"],
  ["zh-MO"]            => ["zh-Hant", "感謝使用", "隱私權與安全性"],
  ["en-US", "zh-Hans"] => ["en", "Thank you", "Privacy & Security"],
  ["fr-FR", "en-US"]   => ["en", "Thank you", "Privacy & Security"],
  ["ja-JP"]            => ["en", "Thank you", "Privacy & Security"],
  []                   => ["en", "Thank you", "Privacy & Security"],
}

cases.each do |locales, (expected, greeting, security)|
  config = Cask::Config.new(default: { languages: locales }, env: {}, explicit: {})
  cask = Cask::CaskLoader.load(cask_path.read, config: config)
  cask.config = config
  raise "Wrong language for #{locales}: #{cask.language}" if cask.language != expected

  text = cask.caveats
  [greeting, security, "🌟 Star"].each do |message|
    raise "Missing #{message} for #{locales}" unless text.include?(message)
  end
  raise "Mixed languages for #{locales}" if expected != "en" && text.include?("not notarized")
  raise "Mixed languages for #{locales}" if expected == "en" && text.match?(/\p{Han}/)

  app = cask.artifacts.find { |artifact| artifact.is_a?(Cask::Artifact::App) }
  raise "Missing application artifact" if app&.target&.basename.to_s != "Mac Explorer.app"
  raise "Missing auto-update declaration" unless cask.auto_updates
end

puts "Cask checks passed: #{cases.length} language preferences; Star invitation and app artifact."
