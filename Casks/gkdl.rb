cask "gkdl" do
  version "1.0.0"
  sha256 "609de5668875567d4286a30dca953e905dd865644049a3c97852405fdbb7fb4c"

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

  uninstall quit: "com.zzune.gkdl"

  zap trash: "~/Library/Preferences/com.zzune.gkdl.plist"

  caveats <<~EOS
    Open gkdl and grant Accessibility access in System Settings to enable keyboard features.
    Quit gksdud before enabling gkdl. Quit gkdl normally before uninstalling to restore keyboard settings.
  EOS
end
