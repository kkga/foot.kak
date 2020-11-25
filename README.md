# alacritty.kak

[Alacritty] integration for [Kakoune].

[Alacritty]: https://github.com/alacritty/alacritty
[Kakoune]: https://kakoune.org

## Installation

Add [`alacritty.kak`](rc/alacritty.kak) to your autoload or source it manually.

``` kak
require-module alacritty
```

## Configuration

``` kak
hook global ModuleLoaded x11 %{
  alias global terminal alacritty-terminal
  alias global popup alacritty-terminal-popup
}
```

If you use a tiling window manager, you may want to open windows marked as popups as floating windows.

**Example** – [Sway] configuration:

`~/.config/sway/config`

```
for_window [app_id="Alacritty · Popup"] floating enable
```

[Sway]: https://swaywm.org
