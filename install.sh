sudo apt-get update

DOTFILES_DIR="$HOME/Projects/dotfiles"

ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.config/Code/User/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
ln -sf "$DOTFILES_DIR/.config/Code/User/settings.json" "$HOME/.config/Code/User/settings.json"

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
sudo apt-get install wget
echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/code_latest_amd64.deb
code --install-extension ms-vscode-remote.remote-containers --force

# Docker Desktop
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
wget -O docker-desktop-amd64.deb https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb
sudo apt-get update
sudo apt-get install -y ./docker-desktop-amd64.deb
rm docker-desktop-amd64.deb
# sudo modprobe kvm
# sudo modprobe kvm_amd 
# sudo usermod -aG kvm $USER
