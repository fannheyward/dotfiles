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
