if status is-interactive
    # Commands to run in interactive sessions can go here
end

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------
set --universal --erase fish_greeting
function fish_greeting; end

set -g theme_color_scheme dracula


#-------------------------------------------------------------------------------
# Paths
#-------------------------------------------------------------------------------

## bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

#-------------------------------------------------------------------------------
# Vars
#-------------------------------------------------------------------------------

if isatty
  set -x GPG_TTY (tty)
end

set -gx EDITOR nvim
