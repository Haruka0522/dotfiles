# Created by newuser for 5.4.2


#-----------------------------------
#
#補完系
#
#-----------------------------------
#標準の補完
autoload -Uz compinit
compinit



#-----------------------------------
#
#履歴関係
#
#-----------------------------------
# 履歴ファイルの保存先
export HISTFILE=~/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY


#------------------------------------
#
#パス
#
#------------------------------------
#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

#flutter
export PATH="$PATH:/usr/local/flutter/bin"

#android studio
export PATH="$PATH:/usr/local/android-studio/bin"

#cargo
export PATH="$PATH:~/.cargo/env"

#stack
export PATH="$PATH:~/.local/bin/stack"

#mac場合のみlsコマンドのパスを通す
if [ "$(uname)"=='Darwin' ]; then
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

#------------------------------------
#
#プロンプト
#
#------------------------------------
#カレントディレクトリの表示等
PROMPT="%F{green}%m@%n:%f%F{green}%~%# %f"

#sudoしたときの表示を変更
export SUDO_PROMPT="[sudo] さっさとパスワードを教えなさいよ！"

#pureプロンプトの適用
autoload -U promptinit; promptinit
prompt pure

#------------------------------------
#
#エイリアス
#
#------------------------------------
alias ls='ls --color=auto'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias apt_update='sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt dist-upgrade'

alias pyactivate='source venv/bin/activate'

alias studio='studio.sh'

alias :wq='echo vimじゃないよ'
alias :w='echo vimじゃないよ'
alias :q='echo vimじゃないよ'


#------------------------------------
#
#その他
#
#------------------------------------

#tmuxの自動起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux
