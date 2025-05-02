#!/bin/sh
##This script is download MSM analysis data from http://database.rish.kyoto-u.ac.jp/arch/jmadata/

YYYY=2011
DIR="${YYYY}"
MAX_JOBS=4
JOB_COUNT=0

echo "DIR=$DIR"

for MM in 01 02 03 04 05 06 07 08 09 10 11 12
do
    case $MM in
      01|03|05|07|08|10|12)
       DDS=31 ;;
      04|06|09|11)
       DDS=30 ;;
      02)

        if [ $((YYYY % 400)) -eq 0 ] || { [ $((YYYY % 4)) -eq 0 ] && [ $((YYYY % 100)) -ne 0 ]; }; then
            DDS=29
        else
            DDS=28
        fi
        ;;
    esac


    if [ !  -d "${DIR}" ]; then
    echo "such directory is not exit. create new directory."
    mkdir -p "../MSM/${DIR}"
    fi

    for DD in $(seq -w 1 $DDS) 
    do
#    for DD in 01 02 03;do
      FILENAME="${MM}${DD}.nc"
      FILEPATH="../MSM/${DIR}/${FILENAME}"
      URL="http://database.rish.kyoto-u.ac.jp/arch/jmadata/data/gpv/netcdf/MSM-S/${YYYY}/${MM}${DD}.nc"

      if [ ! -f "${FILEPATH}" ]; then
          echo "Downloading...:${URL}"
          wget -O "${FILEPATH}" "${URL}" --no-verbose &
          sleep 5

      else

          echo "file exists!:${FILEPATH}"
      fi

    done
done

#wget -O "http://database.rish.kyoto-u.ac.jp/arch/jmadata/data/gpv/netcdf/MSM-S/${YYYY}/${MM}${DD}.nc"

    
MM=01
DD=01


#wget --user-agent="Mozilla/5.0" "http://database.rish.kyoto-u.ac.jp/arch/jmadata/data/gpv/netcdf/MSM-S/${YYYY}/${MM}${DD}.nc"

