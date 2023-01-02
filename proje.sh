#!/bin/bash

DIZIN="/home/"
SQL_AD="proje"
SQL_KULLANICI="postgres"
SQL_SIFRE="0000"
SQL_TABLO="table"

while true; do
    TARIH=$(date)
    DEGISIKLIKLER=$(inotifywait -e modify,move,create,delete --format '%w%f%e' -r $DIZIN)
    if [ ! -z "$DEGISIKLIKLER" ]; then
        psql -d "$SQL_AD" -U "$SQL_KULLANICI" -c "INSERT INTO $SQL_TABLO(event) VALUES ('TARIH $DEGISIKLIKLER');"

        echo $TARIH $DEGISIKLIKLER >>/home/zehra/Masaüstü/projeKayit.txt
    fi
    sleep 5
done
