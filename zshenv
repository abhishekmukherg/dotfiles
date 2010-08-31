export ZSHENV_LOADED=1
export PATH=$HOME/bin:/usr/lib/ccache:/opt/cxgames/bin:/opt/eclipse:${PATH}
export EDITOR="vim"
export LESS="--ignore-case -R"
export DEBFULLNAME="Abhishek Mukherjee"
which vimmanpager > /dev/null && export MANPAGER="vimmanpager"
export DEBEMAIL="linkinpark342@gmail.com"

export CC="gcc"
CFLAGS_OPTIMIZATIONS="-march=core2 -pipe"
CFLAGS_WARNINGS="-Wall -Wextra -Wmissing-declarations -Wunsafe-loop-optimizations -Wwrite-strings"
CFLAGS_FEATURES="-fopenmp"
CFLAGS_OTHERS=""
export CFLAGS="${CFLAGS_OPTIMIZATIONS} ${CFLAGS_WARNINGS} ${CFLAGS_FEATURES} ${CFLAGS_OTHERS}"
CXXFLAGS_WARNINGS="-Wabi -Wctor-dtor-privacy -Woverloaded-virtual"
CXXFLAGS_DEFINES="-D_GLIBCXX_PARALLEL"
CXXFLAGS_OTHERS="-std=c++0x"
export CXXFLAGS="${CFLAGS} ${CXXFLAGS_WARNINGS} ${CXXFLAGS_DEFINES} ${CXXFLAGS_OTHERS}"
export WANAL="-pedantic -Weffc++"
export MAKEOPTS="-j5"
export PALUDIS_OPTIONS="--log-level warning"
export INQUISITIO_OPTIONS="--log-level warning"
export BROWSER="/usr/bin/firefox-bin '%s' &"
export TZ='America/New_York'
export QEMU_AUDIO_DRV=pa
export PYTHONUSERBASE="$HOME/.local/lib/python2.6/"
export PYTHONPATH="$HOME/.local/lib/python2.6/"
export SDL_AUDIODRIVER="pulse"

if [[ -z $TRTOP ]] && [[ -f $HOME/.trtop_env ]]; then
	export TRTOP=$(cat $HOME/.trtop_env)
fi
