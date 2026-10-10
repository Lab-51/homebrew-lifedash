cask "lifedash" do
  version "2.15.1"
  sha256 "5a3d9f5665db30a12f62ebd3991954367385c1d87a50453a6e1c239855ffddbf"

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
