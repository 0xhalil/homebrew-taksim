# Written by native/scripts/release.sh on every release; edit native/scripts/taksim.rb.in, not this file.
cask "taksim" do
  version "0.1.1"
  sha256 "111c53f8d706848d2f83280e451acff28d7cf4871f5d02924cae53e7f84d665e"

  url "https://github.com/0xhalil/taksim/releases/download/v#{version}/Taksim-#{version}.zip"
  name "taksim"
  desc "Canvas for coding agents: Claude Code, Codex, Gemini, opencode, Copilot"
  homepage "https://github.com/0xhalil/taksim"

  # the app updates itself (Updater.swift); brew upgrade leaves it to that
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Taksim.app"

  zap trash: [
    "~/.taksim",
    "~/Library/Preferences/dev.taksim.app.plist",
  ]
end
