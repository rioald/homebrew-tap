cask "gkdl" do
  version "1.0.0"
  sha256 "2b7db3c2120f5b1f49adcfd8257016b661a9eecb59914086fbd2f08c6ef02a16"

  url "https://github.com/rioald/gkdl/releases/download/v#{version}/gkdl-#{version}-macos-universal.zip"
  name "gkdl"
  desc "Korean-English input switching and mistyped text correction"
  homepage "https://github.com/rioald/gkdl"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "gkdl.app"

  uninstall quit: "kr.twentyoz.gkdl"

  zap trash: "~/Library/Preferences/kr.twentyoz.gkdl.plist"

  caveats <<~EOS
    Open gkdl and grant Accessibility access in System Settings to enable keyboard features.
    Quit gksdud before enabling gkdl. Quit gkdl normally before uninstalling to restore keyboard settings.
  EOS
end
