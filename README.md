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

If you use a tiling window manager, you may want to open windows marked as
popups as floating windows.

**Example** – [Sway] configuration:

`~/.config/sway/config`

```
for_window [app_id="dmenu"] floating enable
```

[sway]: https://swaywm.org
