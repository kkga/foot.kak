# Ensure that we’re running on Alacritty
remove-hooks global alacritty-detection
hook -group alacritty-detection global ClientCreate '.*' %{
  trigger-user-hook "TERM=%val{client_env_TERM}"
}

define-command -override alacritty-terminal -params 1.. -shell-completion -docstring 'alacritty-terminal <program> [arguments]: create a new terminal as an Alacritty window' %{
  alacritty --command %arg{@}
}

define-command -override alacritty-terminal-popup -params .. -shell-completion -docstring 'alacritty-terminal-popup <program> [arguments]: create a new terminal as an Alacritty window (class: popup, app_id: popup)' %{
  alacritty --class popup --command %arg{@}
}

define-command -override -hidden alacritty -params .. -docstring 'alacritty [flags] [options]: open Alacritty' %{
  nop %sh{
    setsid alacritty "$@" < /dev/null > /dev/null 2>&1 &
  }
}

define-command -override alacritty-integration-enable -docstring 'enable Alacritty integration' %{
  remove-hooks global alacritty-integration
  hook -group alacritty-integration global User 'TERM=alacritty' %{
    alias global terminal alacritty-terminal
    alias global popup alacritty-terminal-popup
  }
}

define-command -override alacritty-integration-disable -docstring 'disable Alacritty integration' %{
  remove-hooks global alacritty-integration
}
