# foot.kak

[Foot] integration for [Kakoune].

[Foot]: https://codeberg.org/dnkl/foot
[kakoune]: https://kakoune.org

## Installation

Add [`foot.kak`](rc/foot.kak) to your autoload or source it manually.

## Usage

```kak
foot-integration-enable
```

**Note**: this integration assumes that **foot** is running in
[server mode][server-mode] and spawns new windows by running `footclient`.

When run as a popup, the window id is set to `popup`. This may be used to
configure floating rules in a window manager.

[Sway][sway] configuration example:

```
# autostart foot server
exec foot --server

# float popup windows
for_window [app_id="popup"] floating enable
```

[sway]: https://swaywm.org
[server-mode]: https://codeberg.org/dnkl/foot#user-content-server-daemon-mode
