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

**Note**: this integration assumes that **foot** is running in [server
mode][server-mode] and spawns new windows by running `footclient` for instant
startup.

When run as a popup, the window id is set to `popup`. You may use it configure
floating rules in your window manager.

Sway configuration example:

```
# autostart foot server
exec foot --server

# float popup windows
for_window [app_id="popup"] floating enable
```

[sway]: https://swaywm.org
[server-mode]: https://codeberg.org/dnkl/foot#user-content-server-daemon-mode
