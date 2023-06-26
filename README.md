# ## 💻 My Dot files: Configuração

### Instalando Git e coisas básicas
xcode-select --install

### 🚀 Oh My ZSH
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm 
rm -rf ~/.zshrc

### ☕ Install rosetta
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

### Setup dot dotfiles
git clone --recurse-submodules https://github.com/marcelofelipes/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

### Instalando o Home brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/Marcelo/.profile && eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --file ~/.dotfiles/Brewfile

#### Java Fixes
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

### Finalização
cd ~ && mkdir ./dev

## Post install
#### Flutter Specific
flutter doctor --android-licenses

## Como Extrair os Arquivos
cd ~/.dotfiles && brew bundle dump --force && git add . && git commit -m "update" && git push

## 🤝 EU

Agradecemos às seguintes pessoas que contribuíram para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="#">
        <img src="https://avatars.githubusercontent.com/marcelofelipes" width="100px;" alt="Foto do seu REI"/><br>
        <sub>
          <b>Marcelo</b>
        </sub>
      </a>
    </td>
  </tr>
</table>
