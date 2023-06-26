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
ZSH_THEME="robbyrussell"

# Lista de temas para escolher aleatoriamente
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Outras configurações e plugins

plugins=(git zsh-nvm)

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
