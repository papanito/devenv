# Development Environment <!-- omit in toc -->

Ansible project to configure my dev environment

- [Usage](#usage)
- [Submodules](#submodules)
- [Ansible vault](#ansible-vault)
- [Backup](#backup)
  - [Setup Backup](#setup-backup)
  - [List Backups](#list-backups)

## Usage

1. Install dependencies

   ```bash
   ansible-galaxy install -r requirements.yml --force-with-deps --force
   ```

2. Run playbook4

   ```bash
   ansible-playbook main.yml --ask-become-pass
   ```

## Submodules

There are additional submodules

- [dot-files](git@gitlab.com:papanito/dot-files.git) for publicly available config files
- [config-files](git@gitlab.com:papanito/config-files.git) for private config files

## Ansible vault

The password file is defines in `ansible.cfg` so none vault parameter has to be specified.

Thus, the variable `backup_encryption_key` has to be created as follows:

```bash
ansible-vault encrypt_string  'SupersecretPa$$phrase' --name 'backup_encryption_key'
```

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
