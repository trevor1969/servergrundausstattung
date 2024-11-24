CCONS="/bin/bash"                        # Pfad zur Konsole
LLOGG="/home/$USER"                      # Pfad zum Logger-Script
LLOGGE="$CCONS $LLOGG/logger.sh"         # Aufruf des Loggers

$LLOGGE neu
$LLOGGE "Starte Logcompress..."
mv $LLOGG/log.txt $LLOGG/$(date +"%Y-%m-%d-%H-%M").log  # Bisheriges Log wird umbenannt
$LLOGGE "Umbenennung ERR: $?"
7z a $LLOGG/log.7z $LLOGG/*.log
$LLOGGE "Packen ERR: $?"
rm $LLOGG/*.log
touch $LLOGG/log.txt
$LLOGGE "Logcompress abgeschlossen."
$LLOGGE "Den Verlauf findest Du in der letzten Datei in log.7z"
$LLOGGE " "
