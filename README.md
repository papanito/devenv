# Development Environment

Ansible project to configure my dev environment(s)

## Usage

Use `setup.sh` to install dependencies and run playbook `main.yml`

```bash
./setup.sh -pa
```

## Git Sub-modules

There are additional git sub-modules under `resources` folder:

- [dot-files](https://gitlab.com/papanito/dot-files.git) my dot-files. They are shared in a separate repo.
- [config-files](https://gitlab.com/papanito/config-files.git) for my config files which may contain more sensitive data - thus this repo is private and not visible.
- [shell-scripts](https://gitlab.com/papanito/shell-scripts.git) for my collection of shell and nautilus scripts

> **Remark**
>
> The project is hosted at [Gitlab](https://gitlab.com/papanito). I automatically synchronize it to Github to share it with Github users.

## Encrypted Data

I use ansible vault to encrypt sensitive data, so I can still share my project. The password file is defined in [`ansible.cfg`](./ansible.cfg), so that no vault parameter has to be specified when running the playbook. Required parameters have to be encrypted accordingly, eg.g the variable `backup_encryption_key`:

```bash
ansible-vault encrypt_string  'SupersecretPa$$phrase' --name 'backup_encryption_key'
```

## Roles

Beside of [external roles](./requirements.yml), I have some roles defined as part of this project, which are:

- [core](./roles/core/README.md) - does basic stuff
- [shell](./roles/shell/README.md) - mainly installs zsh and sets it as default shell
- [resources](./roles/resources/README.md) - Symlinks the resource files and folders (incl. dot-files)
- [packages](./roles/packages/README.md) - installs additional packages for my Arch Linux (incl. packages in AUR)
- [git](./roles/git/README.md) - for projects in Github/Gitlab not having packages, this role clones them to a specific folder

## Backup

For personal backup I use [borg](https://borgbackup.readthedocs.io) and the [playbook backup.yml](./playbooks/backup.yml) cares about the [intial setup](https://borgbackup.readthedocs.io/en/stable/usage/init.html) using `encryption=repokey`:

> `repokey` and `keyfile` use `AES-CTR-256` for encryption and `HMAC-SHA256` for authentication in an encrypt-then-MAC (EtM) construction.

### Setup Backup

Backup is configure by setting the variables `local_backup` and `remote_backup` to `true` in the [host_vars](.(host_vars/). This allows a per-host config of a backup. So my main computer will to a local and remote backup, where some additional computer may not need to be backed-up.

One could also manually setup the backup as follows

```bash
ansible-playbook backup.yml --ask-become-pass  --limit $(hostname)
```

### List Backups

```bash
borg list ssh://$username:$server:$port/$targetdir
```
