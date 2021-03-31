# foot.kak

[Foot] integration for [Kakoune].

[foot]: https://codeberg.org/dnkl/foot
[kakoune]: https://kakoune.org

## Installation

Add [`foot.kak`](rc/foot.kak) to your autoload or source it manually.

```kak
require-module foot
```

## Configuration

```kak
hook global ModuleLoaded wayland %{
  alias global terminal foot-terminal
  alias global popup foot-terminal-popup
}
```

When run as a popup, the window id is set to `dmenu`. You may use it configure
floating rules in your window manager.

**Example** – [Sway] configuration for popup:

`~/.config/sway/config`

```
for_window [app_id="dmenu"] floating enable
```

[sway]: https://swaywm.org
