# Borg Backup

## Initialize

Intialization happens with `encryption=repokey` as described [here](https://borgbackup.readthedocs.io/en/stable/usage/init.html)

> `repokey` and `keyfile` use `AES-CTR-256` for encryption and `HMAC-SHA256` for authentication in an encrypt-then-MAC (EtM) construction.

```bash
username=u146777
server=u146777.your-storagebox.de
port=23
targetdir=/backup/clawfinger

borg create ssh://$username:$server:$port/$targetdir::SUNDAY  /home/aedu --exclude-from /home/aedu/Computer/backup/home_exclude.txt  
borg init --encryption=repokey ssh://$username:$server:$port/$targetdir
```

## List Backups

```bash
borg list ssh://$username:$server:$port/$targetdir
```
