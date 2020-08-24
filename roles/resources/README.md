# Role "resources"

Installs dot-files abd private config-files from git sub-module [`config-files`](https://gitlab.com/papanito/config-files.git) and [`dot-files`](https://gitlab.com/papanito/dot-files.git) using `stow`

|Variable|Description|Default Value|
|--------|-----------|-------------|
|`dotfiles_profile`|Represents a collection of scripts i.e. a subfolder of the `dot-files` and `config-files`|-|
|`stow_targets`|Key-value of targets path for packages, whereas `key` = package name, `value` = path|`scripts`: `~/bin`<br>`nautilus`: `~/.local/share/nautilus/scripts/`|
|`stow_target_default`|Default target for `stow`, in case no `stow_targets` is defined|`~/`|

Example of `stow_targets`:

```yaml
stow_targets:
  scripts: ~/bin
  nautilus: ~/.local/share/nautilus/scripts/
```
