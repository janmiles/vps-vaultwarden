# VPS Vaultwarden

Run a [Vaultwarden](https://github.com/dani-garcia/vaultwarden) password manager with remote backup on your Virtual Private Server (VPS).

:warning: Backups are not encrypted by default!

## Prerequisites

- Create new VPS user with name `vaultwarden`
- Login as `vaultwarden`
- Clone this repository in the user home directory `git clone https://github.com/janmiles/vps-vaultwarden.git`
- Install Docker and Docker compose
- Download and install [Rclone](https://rclone.org/)

## Initial setup

- Create data and backup directories
  - `mkdir ~/vps-vaultwarden/vw-data`
  - `mkdir ~/vps-vaultwarden/vw-backup/backups`
  - `mkdir ~/vps-vaultwarden/vw-backup/logs`
- Setup Rclone connection for remote backup, e.g. `rclone config create my-nextcloud webdav --all`
- Setup crontab to trigger remote backup
  - Run `crontab -e`
  - Add line `30 4 * * * rclone sync ~/vps-vaultwarden/vw-backup/backups my-nextcloud:vaultwarden`
  - Save and close file
- Set server domain and app path in `~/vps-vaultwarden/compose.yaml`

## Run application

Run `~/vps-vaultwarden/update-containers.sh`

## Update application

Run `~/vps-vaultwarden/update-containers.sh`

## Restore backups

This is taken from [github.com/Bruceforce/vaultwarden-backup](https://github.com/Bruceforce/vaultwarden-backup?tab=readme-ov-file#restore) with adapted filepaths.


```sh
# Delete any existing sqlite3 files
rm ~/vps-vaultwarden/vw-data/db.sqlite3*

# Extract the archive
# You may need to install xz first
tar -xJvf ~/vps-vaultwarden/vw-backup/backups/data.tar.xz -C ~/vps-vaultwarden/vw-data/
```

## Linked documentation

You can find additional configuration options here:

### Vaultwarden

https://github.com/dani-garcia/vaultwarden

### Vaultwarden-Backup

https://github.com/Bruceforce/vaultwarden-backup
