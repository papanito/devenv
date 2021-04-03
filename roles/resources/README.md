## Role "resources"

Installs dot-files abd private config-files from git sub-module [`config-files`](https://gitlab.com/papanito/config-files.git) and [`dot-files`](https://gitlab.com/papanito/dot-files.git) using [symlink manager `stow`](https://www.gnu.org/software/stow/)

| Variable              | Description                                                                               | Default Value                                                       |
| --------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------|
| `stow_target_default` | Default location where `stow` symlinks the files and folder                               | `~/` |
| `dotfiles_profile`    | Represents a collection of scripts i.e. a subfolder of the `dot-files` and `config-files` | -                                                                   |
| `resource_folders`    | List of resource folders to bass by `stow`, in case no `stow_targets` is defined          | - |

Each element in `resouce_folders` has optional arguments

| Variable              | Description                                                                               | Default Value                                                       |
| --------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------|
| `no_profile`          | If the `resource_folder` has no [profiles](#Profiles)                                     | -                                                                   |
| `TARGET`              | Key-value of targets path for packages, whereas `key` = package name, `value` = path      | `scripts`: `~/bin`<br>`nautilus`: `~/.local/share/nautilus/scripts/`|

Per default `stow` symlinks dot-files to `stow_target_default`, but for some things e.g. nautilus scripts, you have a different target than `~`, thus with `TARGET` you can override this.

Example of `resource_folders`:

```yaml
stow_target_default: ~/
resource_folders:
  dot-files:
  config-files:
  shell-scripts:
    no_profile: true
    scripts: ~/bin
    nautilus: ~/.local/share/nautilus/

```

### Profiles

I assume you may have different dot-files for your private and work environment, thus I use `profiles` which basically is a subfolder within the project. The `stow` command will sym-link the profile defined in `dotfiles_profile`.
