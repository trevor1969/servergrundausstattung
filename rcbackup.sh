MMASCHINE="ubuntuserver2"
AOrdner=$(date +"%Y-%m-%d-%H-%M")
LLOGGE="/bin/bash /home/$USER/logger.sh"
RREPO="DeinRCLONE-Repo"                       # Das bereits eingerichtete rclone-Repo
RREPOSUB="BackupHomelab/$MMASCHINE"           # Das Unterverzeichnis, in dem die Daten gespeichert werden sollen
RREPOARCH="BackupHomelab/Archiv/$MMASCHINE"   # Wo zu archivierenden Dateien abgelegt werden sollen

$LLOGGE neu
$LLOGGE "Starte Backup..."
cp log.txt log.tmp
rclone sync . "$RREPO:/$RREPOSUB/" --log-file=/home/$USER/log.txt --exclude=log.txt --exclude=snap/ --backup-dir="$RREPO:/$RREPOARCH/$AOrdner" -P
$LLOGGE "Fertig. ERR: $?"
$LLOGGE " "
rm log.tmp
