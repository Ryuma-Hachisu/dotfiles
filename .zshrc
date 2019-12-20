export PATH=$PATH:/sbin
export PATH=/usr/local/bin/heroku:$PATH
export PATH=/opt/local/lib/postgresql93/bin:$PATH

export EDITOR=emacs        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定

bindkey -e               # キーバインドをemacsモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
#setopt correct          # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする


### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
#setopt extended_glob # グロブ機能を拡張する
#unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=100000           # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;


# ------------------------------
# Other Settings
# ------------------------------
### RVM ###
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

### Macports ###
case "${OSTYPE}" in
  darwin*)
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
  ;;
esac

stty stop undef

### Aliases ###
alias r=rails
alias v=vim

# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls && pwd;
}

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
#export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

function gem(){
    $HOME/.rbenv/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
        rehash
    fi
}

# Setup ssh-agent
#if [ -f ~/.ssh-agent ]; then
#    . eval `~/.ssh-agent`
#fi
#if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
#    ssh-agent > ~/.ssh-agent
#    . eval `~/.ssh-agent`
#fi
#ssh-add -l >& /dev/null || ssh-add

ssh-add -l >& /dev/null || ssh-add

if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
    eval `ssh-agent -s`
    ssh-add
fi


function delkasu () { find $1 \( -name '.DS_Store' -o -name '._*' -o -name '.apdisk' -o -name 'Thumbs.db' -o -name 'Desktop.ini' \) -delete -print; }

#source ~/git-completion.bash
#PS1="\h@\u:\W\$(__git_ps1) \$ "

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/eagle/work/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/eagle/work/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Applications/android-sdk-macosx/ndk-bundle
export PATH=$NDK_ROOT:$PATH

export ANDROID_NDK_HOME=$NDK_ROOT
export PATH=${PATH}:$ANDROID_NDK_HOME

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Applications/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/Applications/apache-ant-1.9.6/bin
export PATH=$ANT_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/eagle/work
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=/Users/eagle/.sdkbox
export PATH=${SDKBOX_HOME}/bin:$PATH

export PATH="$HOME/.pyenv/shims:$PATH"
export NDK_CCACHE=/usr/local/bin/ccache

export PATH=$PATH:/Users/eagle/.nodebrew/current/bin

export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libxslt/bin:$PATH"

#cd "/Users/eagle/work"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH


export GO111MODULE=on
export CLOUD_SDK_REPO=cloud-sdk-stretch
export PROTO_VERSION=3.6.1


export PATH="/Applications/google-cloud-sdk/bin:$PATH"
export PATH="/Users/eagle/go/bin:$PATH"

export GOPATH="/Users/eagle/go"

eval "$(gcloud beta emulators datastore env-init)"
export PATH="$(yarn global bin):$PATH"
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH

export OS_USERNAME=gncu20087559
export OS_TENANT_ID=36a4d98f50f44f4997cd05ef32688575
export OS_PASSWORD=ConohaEagle2018
export OS_AUTH_URL=https://identity.tyo1.conoha.io/v2.0
export OS_REGION_NAME=tyo2

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/eagle/work/cocos2d-x/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/eagle/work"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/eagle/work/cocos2d-x/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/eagle/work/cocos2d-x/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/eagle/work"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/eagle/work/cocos2d-x/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
