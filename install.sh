DOTFILES_DIR="$HOME/Projects/dotfiles"

ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.config/Code/User/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

gsettings set org.gtk.Settings.FileChooser show-hidden true

# Proton Pass
sudo apt install -y wget jq
wget -O ProtonPass.deb https://proton.me/download/PassDesktop/linux/x64/ProtonPass.deb
wget -O proton-pass-checksum.json https://proton.me/download/PassDesktop/linux/x64/version.json
CHECKSUM=$(jq -r '.Releases[0].File[0].Sha512CheckSum' proton-pass-checksum.json)
echo "$CHECKSUM  ProtonPass.deb" | sha512sum --check -
sudo dpkg -i ProtonPass.deb
rm proton-pass-checksum.json ProtonPass.deb

# VSCode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders
