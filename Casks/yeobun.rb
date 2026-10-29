cask "yeobun" do
  version "0.8.0"
  sha256 "f930ce39a4dbe324b7fbcee755d1d96c4b050c1ad0cfc10be2681fe252c0f842"

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
