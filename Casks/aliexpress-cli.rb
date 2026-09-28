cask "aliexpress-cli" do
  version "0.2.0"
  sha256 "444f27af6cf206a9a6211e1f6ba93da3905cfd8637c2ede5df29b99bfad9d2ea"

  url "https://github.com/ytyng/aliexpress-cli/releases/download/v#{version}/aliexpress-cli-v#{version}-aarch64-apple-darwin.tar.gz"
  name "aliexpress-cli"
  desc "Search AliExpress from the command line, with an optional desktop window"
  homepage "https://github.com/ytyng/aliexpress-cli"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  # The archive holds a directory, and a cask does not descend into it: the path
  # has to name it. Keep this in step with how the workflow packages the build.
  # The archive is named after the crate, the binary after the command.
  binary "aliexpress-cli-v#{version}-aarch64-apple-darwin/aliexpress"
end
