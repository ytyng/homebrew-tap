cask "arcvault" do
  version "0.1.2"
  sha256 "cfe7a589cee3cb3492669fd446f34005c6fbfaf35e1be9833687b6aced04024c"

  url "https://github.com/ytyng/arcvault/releases/download/v#{version}/arcvault_#{version}_universal.dmg"
  name "ArcVault"
  desc "Mac archiver that produces zip files without garbled names on Windows"
  homepage "https://github.com/ytyng/arcvault"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "arcvault.app"

  # com.ytyng.arcvault is the `identifier` in src-tauri/tauri.conf.json, which
  # Tauri writes into CFBundleIdentifier. These are the paths a Tauri (WKWebView)
  # app creates; zap skips any that do not exist, so the list leans wide.
  zap trash: [
    "~/Library/Caches/com.ytyng.arcvault",
    "~/Library/Preferences/com.ytyng.arcvault.plist",
    "~/Library/Saved Application State/com.ytyng.arcvault.savedState",
    "~/Library/WebKit/com.ytyng.arcvault",
  ]
end
