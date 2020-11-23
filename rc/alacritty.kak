provide-module alacritty %{
  define-command alacritty -params .. -docstring 'Open a new terminal' %{
    nop %sh{
      setsid alacritty --command "${@:-$SHELL}" < /dev/null > /dev/null 2>&1 &
    }
  }

  define-command alacritty-popup -params 1.. -docstring 'Open a new popup' %{
    nop %sh{
      setsid alacritty --class 'Alacritty · Popup' --command "$@" < /dev/null > /dev/null 2>&1 &
    }
  }
}
