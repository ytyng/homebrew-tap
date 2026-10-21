cask "beckwell" do
  version "0.21.0"
  sha256 "52519ee2871a9a07546d1160eab01ecd80eb76550c36005a47d00c977c2b428a"

  url "https://github.com/ytyng/beckwell/releases/download/v#{version}/Beckwell_#{version}_universal.dmg"
  name "Beckwell"
  desc "Tabbed terminal and chat window for Claude Code and Codex, locally or over SSH / Kubernetes"
  homepage "https://github.com/ytyng/beckwell"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Beckwell.app"
  # The app detects being run through a symlink and acts as a command-line
  # client (`beckwell -p "..."`, `beckwell --target NAME DIR`), so the symlink
  # Homebrew makes replaces the app's own "Install beckwell CLI" menu item.
  binary "#{appdir}/Beckwell.app/Contents/MacOS/beckwell"

  # com.ytyng.beckwell is the `identifier` in src-tauri/tauri.conf.json. The
  # user's config.yaml under ~/.config/beckwell is left alone.
  zap trash: [
    "~/Library/Caches/com.ytyng.beckwell",
    "~/Library/Preferences/com.ytyng.beckwell.plist",
    "~/Library/Saved Application State/com.ytyng.beckwell.savedState",
    "~/Library/WebKit/com.ytyng.beckwell",
  ]
end
