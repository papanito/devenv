# Development Environment <!-- omit in toc -->

Ansible project to configure my dev environment

- [Submodules](#submodules)
- [Usage](#usage)
- [Ansible vault](#ansible-vault)
- [Backup](#backup)
  - [Useful commands](#useful-commands)
    - [List Backups](#list-backups)
    - [Delete Backup Location](#delete-backup-location)

## Submodules

There are additional submodules

- [dot-files](git@gitlab.com:papanito/dot-files.git)
- [config-files](git@gitlab.com:papanito/config-files.git)

## Usage

1. Install dependencies

   ```bash
   ansible-galaxy install -r requirements.yml --force-with-deps --force
   ```

## Ansible vault

The password file is defines in `ansible.cfg` so none vault parameter has to be specified.

Thus, the variable `backup_encryption_key` has to be created as follows:

```bash
ansible-vault encrypt_string  'SupersecretPa$$phrase' --name 'backup_encryption_key'
```

## Backup

For personal backup I use [borg](https://borgbackup.readthedocs.io) and the [playbook backup.yml](./backup.yml) cares about the [intial setup](https://borgbackup.readthedocs.io/en/stable/usage/init.html) using `encryption=repokey`:

> `repokey` and `keyfile` use `AES-CTR-256` for encryption and `HMAC-SHA256` for authentication in an encrypt-then-MAC (EtM) construction.

### Useful commands

#### List Backups

```bash
borg list ssh://$username:$server:$port/$targetdir
```

#### Delete Backup Location

```bash
borg delete ssh://$server:23/./backups/test
```
