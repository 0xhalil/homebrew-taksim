# Written by native/scripts/release.sh on every release; edit native/scripts/taksim.rb.in, not this file.
cask "taksim" do
  version "0.1.8"
  sha256 "91b2944ca5e1fcb46678456232441e66db056b15417e8010a8a1f4cd27d4a965"

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
