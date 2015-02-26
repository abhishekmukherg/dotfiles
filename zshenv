export ZSHENV_LOADED=1

if [[ -d ~/.gem/ruby/ ]] && ls ~/.gem/ruby/ >/dev/null 2>&1; then
    for dir in ~/.gem/ruby/*; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
        fi
    done
fi

pathmunge () {
    if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH=$PATH:$1
        else
            PATH=$1:$PATH
        fi
    fi
}

pathmunge /usr/local/bin
pathmunge $HOME/bin
pathmunge $HOME/dev/opt/android-sdk-macosx/tools
pathmunge $HOME/dev/opt/android-sdk-macosx/platform-tools
pathmunge $HOME/.local/share/go/bin
pathmunge $HOME/.rbenv/bin

export PATH

unfunction pathmunge

export DEBFULLNAME="Abhishek Mukherjee"
export DEBEMAIL="abhishek.mukher.g@gmail.com"

# Default program settings
export EDITOR="vim"
export LESS="--ignore-case -R"
export BROWSER="/usr/bin/google-chrome"
which vimmanpager > /dev/null 2>&1 && export MANPAGER="vimmanpager"
which vimpager >/dev/null 2>&1 && export PAGER="vimpager" && alias less=vimpager && alias zless=vimpager

# Go
export GOPATH="$HOME/.local/share/go"

# Gentoo settings
export PALUDIS_OPTIONS="--log-level warning"
export INQUISITIO_OPTIONS="--log-level warning"
export BROWSER="/usr/bin/google-chrome"
export TZ='America/New_York'
export QEMU_AUDIO_DRV=pa
export SDL_AUDIODRIVER="pulse"
export LANG="en_US.UTF-8"
export LOCALE="$LANG"
export HADOOP_HOME=/opt/hadoop
export PATH="$PATH:$HADOOP_HOME/bin"

# RBENV Settings
export RBENV_ROOT=/usr/local/var/rbenv

# Gradle
export GRADLE_OPTS="-Dorg.gradle.daemon=true -Dorg.gradle.parallel=true"

# Set term to xterm-256color if we can
typeset -a find_directories
[[ -d /lib/terminfo ]] && find_directories+=(/lib/terminfo)
[[ -d /user/share/terminfo ]] && find_directories+=(/user/share/terminfo)

if [[ $TERM != *256* ]] && [[ ${#find_directories} -gt 0 ]]; then
    if find ${find_directories[@]} -name 'xterm-256color' > /dev/null 2>&1; then
        export TERM="xterm-256color"
    fi
fi

if [[ -f $HOME/.zshenv.local ]]; then
    source ~/.zshenv.local
fi

export GOPATH="$HOME/.local/share/go:$GOPATH"
export PATH="$HOME/.local/share/go/bin:$PATH"
