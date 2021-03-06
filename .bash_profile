#export path for homebrew
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH:."
export EDITOR="/usr/local/bin/mate -w"

#export python path
export PYTHONPATH=\"$(brew --prefix)/lib/python2.7/site-packages:\$PYTHONPATH\"

#enables color for iTerm
export TERM=xterm-color

#Add UTF-8 Support
export LANG=en_US.UTF-8

export LC_CTYPE=en_US.UTF-8

# Lets get rbenc working

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Fix xcb-shm link
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig


#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'
alias tunnel='ssh -D 8080 -f -C -q -N'
alias reverse-shell='ssh -f -C -q -N -R 12345:localhost:22'
alias flushcache='sudo killall -HUP mDNSResponder'
alias androidDebug='adb forward tcp:9222 localabstract:chrome_devtools_remote'
alias pd='/Applications/Pd-extended.app/Contents/MacOS/Pd-extended'
alias submodule-update='git add . && git commit -m "Updated Submodule" && git push'

# Source all bash completions installed by homebrew
# need to run the following command to support this
# brew install bash-completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#show branch in status line
#PS1='[\W$(__git_ps1 " (%s)")]\$ '
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Setting GIT prompt
c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

branch_color ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        color=""
        if git diff --quiet 2>/dev/null >&2 
        then
            color=${c_green}
        else
            color=${c_red}
        fi
    else
        return 0
    fi
    echo -n $color
}

parse_git_branch ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        gitver="["$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')"]"
    else
        return 0
    fi
echo -e $gitver
}

#It's important to escape colors with \[ to indicate the length is 0
PS1='[\W\[]${c_sgr0}\]\[\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]$ '

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
#for f in $(command ls ~/.node-completion); do
  #f="$HOME/.node-completion/$f"
  #test -f "$f" && . "$f"
#done
# }}}
