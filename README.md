# foot.kak

[Foot] integration for [Kakoune].

[Foot]: https://codeberg.org/dnkl/foot
[kakoune]: https://kakoune.org

## Installation

Add [`foot.kak`](rc/foot.kak) to your autoload or source it manually.

## Usage

Enable the integration in your `kakrc`:

```kak
foot-integration-enable
```

## Commands

- `foot-terminal`: creates a new foot window
  - alias: `terminal`
- `foot-terminal-popup`: creates a new foot window as popup (see below)
  - aliases: `terminal-popup`, `popup`
- `foot-terminal-panel`: creates a new foot window as panel (see below)
  - aliases: `terminal-panel`, `panel`

## Configuration

### Options

- `foot_normal_cmd` (string): shell command to run for `foot-terminal`
  - default: `footclient`
- `foot_popup_cmd` (string): shell command to run for `foot-terminal-popup`
  - default: `footclient`
- `foot_panel_cmd` (string): shell command to run for `foot-terminal-panel`
  - default: `footclient`

- `foot_normal_flags` (str-list): additional foot flags for `foot_normal_cmd`
  - default: `''`
- `foot_popup_flags` (str-list): additional foot flags for `foot_popup_cmd`
  - default: `'--app-id=popup'`
- `foot_panel_flags` (str-list): additional foot flags for `foot_panel_cmd`
  - default: `'--app-id=panel'`

The default configuration assumes that foot is running in
[server mode][server-mode] and spawns new windows by running `footclient`.

Default `terminal-popup` and `terminal-panel` commands add specific `app-id`'s
to the foot window (`popup` and `panel`), which can be used by a window manager
for further adjustments.

For example, in [Sway][sway] the following configuration can work:

```sh
exec foot --server  # autostart foot server
for_window [app_id="popup"] floating enable # float popup windows
```

### Customizing commands and flags

It's possible to override the default options to use custom commands and/or
flags for spawning new windows.

### Configuration examples

To use a new foot process instead of a server client, add the following in your
`kakrc`:

```kak
foot-integration-enable
set-option global foot_normal_cmd 'foot'
set-option global foot_popup_cmd 'foot'
set-option global foot_panel_cmd 'foot'
```

To pass custom flags to foot popup windows:

```kak
foot-integration-enable
set-option global foot_popup_flags '--app-id=popup' '-o colors.alpha=0.8' # use transparent background for popup
```

To use a completely different command:

```kak
foot-integration-enable
set-option global foot_panel_cmd 'sway-panel-term' # use custom command for panel
set-option -remove global foot_panel_flags # remove default flags
```

[sway]: https://swaywm.org
[server-mode]: https://codeberg.org/dnkl/foot#user-content-server-daemon-mode
