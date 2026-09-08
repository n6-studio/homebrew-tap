cask "yeobun" do
  version "0.1.0"
  sha256 "da22bfd84698ed1f4864811fb9b63870cfc2cbc357a942f0aad3ad4dd0f53f76"

  url "https://github.com/n6-studio/yeobun/releases/download/v#{version}/Yeobun-#{version}.dmg"
  name "Yeobun"
  desc "Control Center–style menu-bar utilities"
  homepage "https://n6.studio/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Yeobun.app"
  binary "#{appdir}/Yeobun.app/Contents/MacOS/yeobun-cli", target: "yeobun"

  zap trash: [
    "~/Library/Application Support/Yeobun",
    "~/Library/Preferences/studio.n6.yeobun.plist",
  ]

  caveats do
    <<~EOS
      Yeobun is signed locally, not notarized. If Gatekeeper blocks it,
      right-click the app and choose Open.
    EOS
  end
end
