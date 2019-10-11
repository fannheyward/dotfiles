# macOS defaults setting

Change application language:

```sh
defaults write com.apple.Safari AppleLanguages '("zh-Hans-CN")'
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
