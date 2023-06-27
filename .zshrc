# Detectar a plataforma atual
case "$(uname -s)" in
    Linux*)
        # Configurações para Linux
        export PATH="$HOME/bin:/usr/local/bin:$PATH"
        ;;
    Darwin*)
        # Configurações para macOS
        export PATH="$HOME/bin:/usr/local/bin:$PATH"
        ;;
    *)
        # Configurações padrão para outras plataformas
        ;;
esac

# Path para a instalação do oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Personal Aliases
alias dotfiles="cd ~/.dotfiles && brew bundle dump --force && git add . && git commit -m 'update' && git push && cd ~"

# Carregar variáveis de ambiente do arquivo .env, se existir
if [ -f ~/.dotfiles/dotenv/.env ]; then
  export $(grep -v '^#' ~/.dotfiles/dotenv/.env | xargs)
fi

alias load-env="source ~/.zshrc"

# =================

# Definir o tema a ser carregado
ZSH_THEME="agnoster"

# Lista de temas para escolher aleatoriamente
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Outras configurações e plugins

plugins=()
# Configuração do ZPLUG_HOME
ZPLUG_HOME="$HOME/.dotfiles/.zplug"

# Instalar o zplug se não estiver instalado
if [ ! -d "$ZPLUG_HOME" ]; then
    alias install-zplug="git clone https://github.com/zplug/zplug $ZPLUG_HOME"
    install-zplug
fi
source $ZPLUG_HOME/init.zsh
zplug load
source $ZSH/oh-my-zsh.sh

# Configurações específicas para cada plataforma
case "$(uname -s)" in
    Linux*)
        # Configurações adicionais para Linux
        ;;
    Darwin*)
        # Configurações adicionais para macOS
        export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
        ;;
    *)
        # Configurações adicionais para outras plataformas
        ;;
esac

# Configurações finais
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# A next-generation cd command with an interactive filter
#zplug "b4b4r07/enhancd", use:init.sh

# Warn you when you run a command that you've got an alias for
zplug "djui/alias-tips"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# oh-my-zsh base config
# This is a selection of the available libs
zplug "robbyrussell/oh-my-zsh", use:"lib/{completion,correction,git,grep,history,key-bindings,termsupport}.zsh"
# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh
#zplug "plugins/rails", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/helm", from:oh-my-zsh
zplug "plugins/terraform", from:oh-my-zsh
zplug "plugins/dotenv", from:oh-my-zsh

# third party oh-my-zsh plugins
zplug 'RobertDeRose/virtualenv-autodetect', as:plugin # really slow

# Commands
zplug "rupa/z", use:z.sh
zplug "kmccormick/rsnapshot-timestamp", as:command
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
