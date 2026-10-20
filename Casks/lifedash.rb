cask "lifedash" do
  version "2.18.1"
  sha256 "cf3713ddd612248293f4f801fa2d4d763f6982d7523c859abf3ad257b7a11c5a"

  url "https://github.com/Lab-51/lifedash/releases/download/v#{version}/LifeDash-#{version}-mac-arm64.dmg"
  name "LifeDash"
  desc "AI meeting intelligence — record, transcribe, and extract action items locally"
  homepage "https://lifedash.space"

  depends_on macos: ">= :monterey"

  app "LifeDash.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/LifeDash.app"]
  end

  zap trash: [
    "~/Library/Application Support/LifeDash",
    "~/Library/Preferences/com.lifedash.app.plist",
    "~/Library/Caches/com.lifedash.app",
  ]
end
