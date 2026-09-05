cask "aliexpress-cli" do
  version "0.1.0"
  sha256 "db69804d6476ffdfb7ec0ef02e911163fd4f70a36cdf767c22076d887b078105"

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
