cask "lifedash" do
  version "2.2.28"
  sha256 "b6f8336633c72400d78f2860699b5c8cf4e6a8f521e55ee67a2e7363856706b8"

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
