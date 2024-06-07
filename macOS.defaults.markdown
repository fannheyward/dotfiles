# macOS defaults setting

Stop writing of `.DS_Store`

```sh
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

Change application language:

```sh
defaults write com.apple.Safari AppleLanguages '("zh-Hans-CN")'
```

Decrease key repeat delay:

```sh
defaults write -g KeyRepeat -int 1
```

VSCode:

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
```

Dark mod for menu bar only:

```sh
defaults write -g NSRequiresAquaSystemAppearance -bool Yes
```

IDEA

```sh
defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
```

Maccy

```sh
defaults write org.p0deje.Maccy hotKey control+option+m
defaults write org.p0deje.Maccy pasteByDefault true
defaults write org.p0deje.Maccy fuzzySearch true
```

Ollama

```sh
launchctl setenv OLLAMA_ORIGINS "*"
launchctl setenv OLLAMA_HOST "0.0.0.0"
```
