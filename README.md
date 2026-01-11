# vps-vaultwarden
Virtual Private Server (VPS) Vaultwarden password manager

## Prerequisites

- Create new VPS user with name `vaultwarden`
- Login as `vaultwarden`
- Clone this repository in the user home directory `git clone git@github.com:janmiles/vps-vaultwarden.git`
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
