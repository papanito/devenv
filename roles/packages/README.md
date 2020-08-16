# Role "packages"

Installs and configure `packages`.

## Requirements

- [`aur`](https://github.com/kewlfft/ansible-aur)

## Role Variables

### General parameters

These are all variables

|Parameter|Description|Default Value|
|---------|-----------|-------------|
|`packages`|List of packages to instal from repos|-|
|`aur_packages`|List of packages to install from aur, applies only to Arch-based distros|-|


## Examples

```yaml
packages:
  - tmux
  - bashtop

# for arch linux, packages only found in aur
aur_packages:
  - lens-bin
```