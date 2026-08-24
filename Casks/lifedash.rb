cask "lifedash" do
  version "2.12.0"
  sha256 "6161a4d235dad491a95fe1201a1ef1f6de166e7307edf36adb46220fb767a334"

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
