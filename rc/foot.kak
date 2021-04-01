provide-module foot %{
  define-command foot -params .. -shell-completion -docstring 'Open a new terminal' %{
    nop %sh{
      setsid footclient "$@" < /dev/null > /dev/null 2>&1 &
    }
  }

  define-command foot-popup -params .. -shell-completion -docstring 'Open a new terminal as a popup' %{
    foot -a 'popup' %arg{@}
  }

  # Conform to terminal as aliases
  define-command foot-terminal -params 1.. -shell-completion -docstring 'Open a new terminal' %{
    foot %arg{@}
  }

  define-command foot-terminal-popup -params 1.. -shell-completion -docstring 'Open a new terminal as a popup' %{
    foot-popup %arg{@}
  }
}
