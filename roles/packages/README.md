# Role "packages"

Installs and configure `packages`.

## Requirements

- [`aur`](https://github.com/kewlfft/ansible-aur)

## Role Variables

### General parameters

These are all variables

|Parameter|Description|Default Value|
|---------|-----------|-------------|
|`packages`|Dictionary of packages to install|-|
|The `packages` contains a list of packages for each type of source. Supported source types are:|
|`pkg`|List of packages to install from standard package installer|-|
|`aur`|List of packages to install from aur, applies only to Arch-based distros|-|
|`pip`|List of packages to install from pip|-|

The list itself usually contains only package names. However in case you need to pin or remove packages, you can add a dict like this

```yml
{ name: python-hcloud, status: absent}
```

Above will ensure the package `python-hcloud` will not be installed via package manager - cause we will install the package via `pip`.

## Examples

```yaml
packages:
  pkg:
    - tmux
    - bashtop
    - { name: python-hcloud, status: absent}
    # for arch linux, packages only found in aur
  aur:
    - git-extras
    - lens-bin
  pip:
    - pexpect
    - pre-commit
    - hcloud
    - gphotos-sync
```
