#!/bin/bash

# based on:
# - https://github.com/ricbra/dotfiles/blob/master/bin/setup_osx
# - https://github.com/atomantic/dotfiles/blob/master/install.sh

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function ok() {
    echo -e "$COL_GREEN[ok]$COL_RESET "$1
}

function bot() {
    echo -e "\n$COL_GREEN\[._.]/$COL_RESET - "$1
}

function running() {
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function action() {
    echo -e "\n$COL_YELLOW[action]:$COL_RESET\n ⇒ $1..."
}

function warn() {
    echo -e "$COL_YELLOW[warning]$COL_RESET "$1
}

function error() {
    echo -e "$COL_RED[error]$COL_RESET "$1
}

#/ Set up macOS security settings

# Disable remote apple events
sudo systemsetup -setremoteappleevents off

# Disable remote login
sudo systemsetup -setremotelogin off

# Disable guest account login
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

running "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

running "Save screenshots to the Downloads"
defaults write com.apple.screencapture location -string "${HOME}/Downloads";ok

running "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true;ok

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool true

# Set dock tile size
defaults write com.apple.dock tilesize -int 60

# set dock tile large size
defaults write com.apple.dock largesize -int 85

# autohide dock
defaults write com.apple.dock autohide -bool true

# Allow text selection in the Quick Look window
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# remove delay
defaults write com.apple.dock autohide-delay -float 0

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "webdizz"

running "allow 'locate' command"
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist > /dev/null 2>&1;ok

running "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" ";ok

running "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true;ok

running "Disable the crash reporter"
defaults write com.apple.CrashReporter DialogType -string "none";ok

running "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1;ok


running "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1;ok

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

running "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3;ok

running "Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144;ok
running "Follow the keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true;ok

running "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false;ok

running "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10;ok

running "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true;ok

running "Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true;ok

running "Make Dock more transparent"
defaults write com.apple.dock hide-mirror -bool true;ok

running "Bottom right screen corner → Start screen saver"
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0;ok