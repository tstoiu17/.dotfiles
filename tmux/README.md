# Tmux

## Shortcuts for the shortcuts

Instead of using the tmux key combination of a prefix key followed by a command
key, I use macros for the tmux key combos that I frequently press. This way
those tmux action is 1 key chord instead of 2.

I'm using terminal emulator macros (via Alacritty):

| Macro                              | Tmux Key Combo   | Description                         |
| ---------------------------------- | ---------------- | ----------------------------------- |
| <kbd>Alt</kbd> + <kbd>t</kbd>      | `<prefix>t`      | new window (tab)                    |
| <kbd>Alt</kbd> + <kbd>w</kbd>      | `<prefix>w`      | close active pane                   |
| <kbd>Alt</kbd> + <kbd>s</kbd>      | `<prefix>s`      | choose session interactively        |
| <kbd>Alt</kbd> + <kbd>v</kbd>      | `<prefix>%`      | split pane vertically               |
| <kbd>Alt</kbd> + <kbd>[1-9]</kbd>  | `<prefix>[1-9]`  | select window (tab) 1-9             |
| <kbd>Alt</kbd> + <kbd>Q</kbd>      | `<prefix>Q`      | terminate session                   |
| <kbd>Alt</kbd> + <kbd>d</kbd>      | `<prefix>d`      | detach session                      |
| <kbd>Alt</kbd> + <kbd>z</kbd>      | `<prefix>z`      | toggle zoom current pane            |
| <kbd>Alt</kbd> + <kbd>T</kbd>      | `<prefix>T`      | move current pane to its own window |
| <kbd>Alt</kbd> + <kbd>[hjkl]</kbd> | `<prefix>[hjkl]` | move between pane                   |
| <kbd>Alt</kbd> + <kbd>,</kbd>      | `<prefix>,`      | rename current window               |
