ttext=$1
PPFAD="/home/$USER/log.txt"

if [ "$ttext" = "neu" ]
then
        echo " " >>$PPFAD
        echo " " >>$PPFAD
        echo "$(date) - ------------------------------------------------------------" >>$PPFAD
        clear
else
        echo "$(date) - $ttext" >>$PPFAD
        echo "$(date) - $ttext"
fi
