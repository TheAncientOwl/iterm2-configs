local orange=$(printf "\033[1;38;5;209m")
local red=$(printf "\033[1;38;5;203m")
local brown=$(printf "\033[0;38;5;137m")
local delim=$(printf "\033[1;38;5;240m")
local lime=$(printf "\033[1;38;5;149m")

function get_hostname {
    echo featherbook
}

function get_username {
    username=$(whoami)

    echo $username
}

function get_pwd {
    pwd="$PWD"

    case "$pwd" in
    *"$USER"*)
        pwd="⚡${pwd#"/Users/$USER"}"
        ;;
    esac

    echo $pwd
}

PROMPT='%{$delim%}╭─%{$red%}$(get_username)%{$delim%}@%{$orange%}$(get_hostname) %{$delim%}» %{$brown%}$(get_pwd) $(git_prompt_info)
%{$delim%}╰─%{$lime%}$%{$reset_color%} '

#╭─ ╰─ → « »

ZSH_THEME_GIT_PROMPT_PREFIX="%{$delim%}» $orange%}git$delim%}:(%{$red%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$delim%})%{$red%} ✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$delim%}) "
