# Log- und Backup-Script-Sammlung

Dieses Repository enthält drei Bash-Scripte zur **Protokollierung**, **Komprimierung von Logs** und **Sicherung von Daten** auf einem Linux-System.

---

## 1. `LOGGER`
**Zweck:** Protokolliert Nachrichten mit Zeitstempel in eine Logdatei.

### Funktionsweise
- **Parameter:** `ttext` (Text, der protokolliert werden soll)
  - Bei `ttext="neu"`: Erstellt einen neuen Abschnitt in der Logdatei mit aktuellem Datum.
  - Sonst: Fügt den Text mit Zeitstempel zur Logdatei hinzu und gibt ihn auf der Konsole aus.
- **Logdatei:** `/home/$USER/log.txt`

### Beispielaufruf
```bash
./logger.sh "Systemstart erfolgreich"
./logger.sh neu  # Neuer Abschnitt
```

---

## 2. `LOGCOMPRESS`
**Zweck:** Komprimiert bestehende Logdateien und bereitet eine neue Logdatei vor.

### Funktionsweise
1. Startet einen neuen Logabschnitt (`logger.sh neu`).
2. Benennt die aktuelle `log.txt` in `YYYY-MM-DD-HH-MM.log` um.
3. Packt alle `.log`-Dateien mit `7z` in `log.7z`.
4. Löscht die unkomprimierten Logs und erstellt eine neue `log.txt`.
5. Protokolliert jeden Schritt im Log.

### Voraussetzungen
- `7z` muss installiert sein (`sudo apt install p7zip-full`).
- `logger.sh` muss im selben Verzeichnis liegen.

### Beispielaufruf
```bash
./logcompress.sh
```

---

## 3. `RCBACKUP`
**Zweck:** Synchronisiert lokale Daten mit einem Remote-Repository (z. B. Cloud-Speicher) und archiviert geänderte Dateien.

### Funktionsweise
1. Startet einen neuen Logabschnitt.
2. Synchronisiert das aktuelle Verzeichnis (ausschließlich `log.txt` und `snap/`) mit dem Remote-Repository (`RREPO`).
3. Geänderte/gelöschte Dateien werden im Archiv-Ordner (`RREPOARCH`) gespeichert.
4. Protokolliert den Vorgang im Log.

### Konfiguration
- **Variablen anpassen:**
  - `MMASCHINE`: Name der Maschine (z. B. `ubuntuserver2`).
  - `RREPO`: Name des `rclone`-Repositories.
  - `RREPOSUB`/`RREPOARCH`: Zielpfade für Backup/Archiv.

### Voraussetzungen
- `rclone` muss konfiguriert sein.
- `logger.sh` muss im Pfad `/root/` liegen.

### Beispielaufruf
```bash
./rcbackup.sh
```

---

## Allgemeine Hinweise
- **Logdateien:** Werden in `/home/$USER/` gespeichert.
- **Fehlerbehandlung:** Jeder Schritt protokolliert den Exit-Code (`ERR: $?`).
- **Sicherheit:** Stelle sicher, dass die Scripte ausführbar sind (`chmod +x *.sh`).

---
**Lizenz:** [MIT](LICENSE) 

---
### Anpassungsmöglichkeiten
- **Pfade:** Ersetze `/home/$USER/` durch absolute Pfade, falls nötig.
- **Excludes:** Passe die `--exclude`-Option in `RCBACKUP` an, um weitere Verzeichnisse auszuschließen.

