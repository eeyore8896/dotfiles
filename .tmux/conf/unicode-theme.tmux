# Default unless $TMUX_POWERLINE_SYMBOLS is already set
if-shell ': ${TMUX_POWERLINE_SYMBOLS?}' '' 'set-environment -g TMUX_POWERLINE_SYMBOLS "unicode"'

# Show flag if terminal reports support for fewer than 8 colors
#
# Current: *
# Previous: -
# Bell: !
# Content: +
# Activity/Silence: #
#
if-shell 'test "$(tput colors)" -lt 8' 'set-environment -g TMUX_POWERLINE_FLAG "#F"' 'set-environment -g TMUX_POWERLINE_FLAG ""'
#if-shell 'test "$(tput colors)" -lt 16' 'set-environment -g TMUX_POWERLINE_FLAG "#F"' ''
#if-shell 'test "$(tput Co)" -lt 16' 'set-environment -g TMUX_POWERLINE_FLAG "#F"' ''

#if-shell 'test "$(tput colors)" -ge 16' \
    #'if-shell \'test "$(tput Co)" -ge 16\' \
        #\'TRUE\' \
        #\'FALSE\'' \
    #'set-environment -g TMUX_POWERLINE_FLAG "#F"'

# Aliases (assuming Unicode support)
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "on"' 'set-environment -g TMUX_POWERLINE_SYMBOLS "powerline"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "yes"' 'set-environment -g TMUX_POWERLINE_SYMBOLS "powerline"'

if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "off"' 'set-environment -g TMUX_POWERLINE_SYMBOLS "unicode"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "no"' 'set-environment -g TMUX_POWERLINE_SYMBOLS "unicode"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "none"' 'set-environment -g TMUX_POWERLINE_SYMBOLS "unicode"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "compatible"' 'set-environment -g TMUX_POWERLINE_SYMBOLS "unicode"'

if-shell ': ${TMUX_POWERLINE_COMPACT_ACTIVE?}' 'set-environment -g TMUX_POWERLINE_COMPACT_CURRENT "${TMUX_POWERLINE_COMPACT_ACTIVE}" ; set-environment -r TMUX_POWERLINE_COMPACT_ACTIVE'

# ASCII glyphs which don't require patched font or Unicode support
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "ascii"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_FULL ""'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "ascii"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_THIN "|"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "ascii"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_FULL ""'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "ascii"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_THIN "|"'

# Unicode glyphs which don't require patched font
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "unicode"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_FULL ""'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "unicode"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_THIN "│"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "unicode"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_FULL ""'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "unicode"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_THIN "│"'

# Powerline glyphs at U+E000-U+F8FF range ("Private Use Area")
# These are the code points used in the new universal Powerline
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_FULL ""'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_THIN ""'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_FULL ""'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_THIN ""'

# Powerline glyphs at U+2B60-U+2BFF range ("Miscellaneous Symbols and Arrows")
# These are the code points used in Lokaltog/vim-powerline
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "vim-powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_FULL "⮀"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "vim-powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_RIGHT_THIN "⮁"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "vim-powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_FULL "⮂"'
if-shell 'test $(echo "${TMUX_POWERLINE_SYMBOLS}") = "vim-powerline"' 'set-environment -g TMUX_POWERLINE_SYMBOL_LEFT_THIN "⮃"'

#
# Status bar background colour
#
set-window-option -g status-bg colour236 # Gray

#
# Status bar left side
#
set-window-option -g status-left ""

# Show session name
#set-window-option -g status-left "#[bg=colour240,fg=white] #S #[fg=colour236,reverse]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}"
#set-window-option -g status-left-length 40

#
# Status bar right side
#
set-window-option -g status-right "#[fg=colour244]#S:#I:#P #[fg=colour240]${TMUX_POWERLINE_SYMBOL_LEFT_FULL}#[fg=colour231,bg=colour240] #H #[fg=colour252]${TMUX_POWERLINE_SYMBOL_LEFT_FULL}#[fg=black,bg=colour252,nobold] #(LANG=C date '+%%Y-%%m-%%d(%%a) %%H:%%M') "
set-window-option -g status-right-length 80

#
# Status bar window without activity
#
if-shell 'test $(echo "${TMUX_POWERLINE_COMPACT_INACTIVE}") = "on"' \
    'set-window-option -g window-status-format "#[fg=colour236,nounderscore]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}#[default,bold,nounderscore] #I${TMUX_POWERLINE_FLAG} #[fg=colour236,reverse]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}"' \
    'set-window-option -g window-status-format "#[fg=colour236,nounderscore]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}#[default,bold,nounderscore] #I${TMUX_POWERLINE_FLAG} #[fg=colour240,reverse]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}#[default]#[bg=colour240]#[nounderscore] #[default]#[fg=colour231,bg=colour240]#W#[nounderscore] #[fg=colour236,reverse]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}"'

# Black on green
set-window-option -g window-status-attr none
set-window-option -g window-status-bg colour244
set-window-option -g window-status-fg black

# Black on white
#set-window-option -g window-status-bg colour231
#set-window-option -g window-status-fg black

# Green more alike non-256color
#set-window-option -g window-status-bg colour40

#
# Status bar window currently active
#
if-shell 'test $(echo "${TMUX_POWERLINE_COMPACT_CURRENT}") = "on"' \
    'set-window-option -g window-status-current-format "#[fg=colour236]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}#[default,fg=colour231,bold] #I${TMUX_POWERLINE_FLAG} #[default,fg=colour236,reverse]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}"' \
    'set-window-option -g window-status-current-format "#[fg=colour236]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}#[default,bold] #I${TMUX_POWERLINE_FLAG} #[fg=colour123,reverse]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}#[default]#[bg=colour123] #W #[fg=colour236,reverse]${TMUX_POWERLINE_SYMBOL_RIGHT_FULL}"'

set-window-option -g window-status-current-attr none
set-window-option -g window-status-current-bg colour31
set-window-option -g window-status-current-fg black

#
# Status bar window last active (Tmux 1.8+)
#
set-window-option -g window-status-last-attr none
set-window-option -g window-status-last-bg colour252
set-window-option -g window-status-last-fg black

#
# Status bar window with activity/silence (monitor-activity, monitor-silence)
#
set-window-option -g window-status-activity-attr bold,underscore
set-window-option -g window-status-activity-bg colour219
set-window-option -g window-status-activity-fg black

#
# Status bar window with bell triggered
#
set-window-option -g window-status-bell-attr bold,underscore
set-window-option -g window-status-bell-bg red # Red is urgent
set-window-option -g window-status-bell-fg black

#
# Status bar window with content found (monitor-content)
#
#set-window-option -g window-status-content-attr bold,underscore
#set-window-option -g window-status-content-bg colour226 # Yellow because search highlighting usually is
#set-window-option -g window-status-content-fg black

#
# Race condition fix
# Loop once to let Tmux catch up on new environment variables
#
TMUX_POWERLINE_THEME_LOOPFILE="$HOME/.tmux/conf/unicode-theme.loop"
if-shell "test -e ${TMUX_POWERLINE_THEME_LOOPFILE}" "run-shell 'rm "${TMUX_POWERLINE_THEME_LOOPFILE}"'" 'run-shell "touch ${TMUX_POWERLINE_THEME_LOOPFILE}" ; source-file "$HOME/.tmux/conf/unicode-theme.tmux"'
#set-environment -r TMUX_POWERLINE_THEME_LOOPFILE

#
# Remove environment variables
#
#set-environment -r TMUX_POWERLINE_SYMBOL_RIGHT_FULL
#set-environment -r TMUX_POWERLINE_SYMBOL_RIGHT_THIN
#set-environment -r TMUX_POWERLINE_SYMBOL_LEFT_FULL
#set-environment -r TMUX_POWERLINE_SYMBOL_LEFT_THIN
#set-environment -r TMUX_POWERLINE_FLAG

