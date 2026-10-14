# Written by native/scripts/release.sh on every release; edit native/scripts/taksim.rb.in, not this file.
cask "taksim" do
  version "0.1.0"
  sha256 "2dea87b059c079a3c69b07beb33fc26a4a7c64efca4b55c91b49c9d17b2d84dd"

  url "https://github.com/0xhalil/taksim/releases/download/v#{version}/Taksim-#{version}.zip"
  name "taksim"
  desc "Canvas for coding agents: Claude Code, Codex, Gemini, opencode, Copilot"
  homepage "https://github.com/0xhalil/taksim"

  # the app updates itself (Updater.swift); brew upgrade leaves it to that
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Taksim.app"

  # not signed with a Developer ID yet: without this macOS refuses the first launch. Homebrew's declarative
  # postflight_steps have no step for this on purpose (brew style flags the block); a tap of our own may use it.
  # Once releases are notarized, remove this block.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Taksim.app"]
  end

  zap trash: [
    "~/.taksim",
    "~/Library/Preferences/dev.taksim.app.plist",
  ]
end
