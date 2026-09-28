cask "side-by-side-browser" do
  version "0.2.0"
  sha256 "4887cd6751eef12999fe183d85d891a5507a3dc986ec50a0fbb4036a087cf929"

  # electron-builder turns the spaces in the product name into dots in the
  # artifact name, and keeps them in the app bundle name.
  url "https://github.com/ytyng/side-by-side-browser/releases/download/v#{version}/Side.by.Side.Browser-#{version}-universal.dmg"
  name "Side by Side Browser"
  desc "Two-pane browser for comparing before/after migration pages"
  homepage "https://github.com/ytyng/side-by-side-browser"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Side by Side Browser.app"

  # com.ytyng.side-by-side-browser is the electron-builder appId. Electron keeps
  # its own state under the product name in Application Support and Logs.
  zap trash: [
    "~/Library/Application Support/Side by Side Browser",
    "~/Library/Caches/com.ytyng.side-by-side-browser",
    "~/Library/Caches/com.ytyng.side-by-side-browser.ShipIt",
    "~/Library/Logs/Side by Side Browser",
    "~/Library/Preferences/com.ytyng.side-by-side-browser.plist",
    "~/Library/Saved Application State/com.ytyng.side-by-side-browser.savedState",
  ]
end
