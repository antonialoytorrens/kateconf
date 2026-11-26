# Kate configuration

Portable Kate config to sync between machines.

## Contents

| Repo path | System destination |
|-----------|--------------------|
| `config/katerc` | `~/.config/katerc` |
| `config/kate/` | `~/.config/kate/` (external tools, LSP, formatting, debugger) |
| `share/kxmlgui5/katebuild/` | `~/.local/share/kxmlgui5/katebuild/` (Build shortcut) |
| `share/kate/anonymous.katesession` | `~/.local/share/kate/anonymous.katesession` (plugins + layout) |

Project sessions, stash, metainfos, and telemetry are not included.

## Requirements

- Kate (tested with 25.x) (`apt install kate`).
- Hack font (`apt install fonts-hack`).

## Usage

Before capturing, arrange Kate the way you want it on other machines (sidebars, tool views, panel sizes). `capture.sh` copies `anonymous.katesession` as-is, so the current layout and plugin state become what gets installed elsewhere. Close unused tool views (e.g. debugger) first if you do not want them in the synced layout.

Close Kate before installing; if it is open it may overwrite the changes.

```bash
# Capture current Kate changes:
./capture.sh
git add -A && git commit -m "..." && git push

# Install custom configuration into another PC:
git pull
./install.sh
```

## Notes

- Color theme: Dracula.
- Custom shortcut: `Ctrl+Shift+Space` for Build and Run Selected Target (`katebuild`).
