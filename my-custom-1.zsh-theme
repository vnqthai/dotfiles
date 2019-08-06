# This theme is based on af-magic theme

# Color codes refer here: https://en.wikipedia.org/wiki/ANSI_escape_code, section `8-bit`
# Or here: http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim, field `ctermfg`

# primary prompt
PROMPT='
$FG[068]%4~ $(git_prompt_info)
$FG[068]✈ %{$reset_color%}'
# Above line: Put prompt char after the first ] (example: ➜ or $ or anything else)
# Can consider to add spaces at the end

# right prompt
RPROMPT=''

# git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[031]("
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214] *%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[031])%{$reset_color%}"

# backup: time string
# $FG[235][%D{%a %b %d %H:%M:%S]}%{$reset_color%}
# (have 1 space at beginning)
