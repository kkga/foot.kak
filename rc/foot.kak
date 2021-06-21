# Ensure that we’re running on foot
remove-hooks global foot-detection
hook -group foot-detection global ClientCreate '.*' %{
  trigger-user-hook "TERM=%val{client_env_TERM}"
}

define-command -override foot-terminal -params 1.. -shell-completion -docstring 'foot-terminal <program> [arguments]: create a new terminal as an foot window' %{
  foot %arg{@}
}

define-command -override foot-terminal-popup -params .. -shell-completion -docstring 'foot-terminal-popup <program> [arguments]: create a new terminal as an foot window (class: popup, app_id: popup)' %{
  foot --app-id=popup %arg{@}
}

define-command -override -hidden foot -params .. -docstring 'foot [flags] [options]: open foot' %{
  nop %sh{
    setsid footclient "$@" < /dev/null > /dev/null 2>&1 &
  }
}

define-command -override foot-integration-enable -docstring 'enable foot integration' %{
  remove-hooks global foot-integration
  hook -group foot-integration global User 'TERM=foot' %{
    alias global terminal foot-terminal
    alias global popup foot-terminal-popup
  }
}

define-command -override foot-integration-disable -docstring 'disable foot integration' %{
  remove-hooks global foot-integration
}
