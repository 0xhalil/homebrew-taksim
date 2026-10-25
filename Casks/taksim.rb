# Written by native/scripts/release.sh on every release; edit native/scripts/taksim.rb.in, not this file.
cask "taksim" do
  version "0.2.1"
  sha256 "f10b86c0b2c850cbc9abe1003f625c6bf3528a1d95cf03297ca128b5192b0c22"

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
