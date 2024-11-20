CCONS="/bin/bash"                        # Pfad zur Konsole
LLOGG="/home/$USER"                      # Pfad zum Logger-Script
LLOGGE="$CCONS $LLOGG/logger.sh"         # Aufruf des Loggers

$LLOGGE neu
$LLOGGE "Starte Logcompress..."
mv log.txt $(date +"%Y-%m-%d-%H-%M").log  # Bisheriges Log wird umbenannt
$LLOGGE "Umbenennung ERR: $?"
7z a log.7z *.log
$LLOGGE "Packen ERR: $?"
rm *.log
touch log.txt
$LLOGGE "Logcompress abgeschlossen."
$LLOGGE "Den Verlauf findest Du in der letzten Datei in log.7z"
$LLOGGE " "
