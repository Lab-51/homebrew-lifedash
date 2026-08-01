cask "lifedash" do
  version "2.5.0"
  sha256 "4d04caac26067203f06a33ddbc5f4caa87c49ac90c837de78c2ba0008f1f48cf"

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
