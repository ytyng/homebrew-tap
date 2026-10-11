cask "side-by-side-browser" do
  version "0.2.1"
  sha256 "b65ae8a9e96995637fbdc42da68111f081dd4d39e5b17a26356c98f1931a10eb"

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
