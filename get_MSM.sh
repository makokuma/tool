#!/bin/sh
##This script is download MSM analysis data from http://database.rish.kyoto-u.ac.jp/arch/jmadata/

YYYY=2008
DIR="${YYYY}"
echo "DIR=$DIR"
if [ !  -d "${DIR}" ]; then
 echo "such directory is not exit. create new directory."
 mkdir -p "${DIR}"
fi

for MM in 01 02 03 04 05 06 07 08 09 10 11 12;do
    for DD in 01 02 03;do
        FILENAME="${MM}${DD}.nc"
        FILEPATH="${DIR}/${FILENAME}"
        URL="http://database.rish.kyoto-u.ac.jp/arch/jmadata/data/gpv/netcdf/MSM-S/${YYYY}/${MM}${DD}.nc"

        if [ ! -f "{FILEPATH}" ]; then
            echo "Downloading...:${URL}"
            wget -O "${FILEPATH}" "${URL}"

        else

            echo "file exists!:${FILEPATH}"
        fi

    done
done

#wget -O "http://database.rish.kyoto-u.ac.jp/arch/jmadata/data/gpv/netcdf/MSM-S/${YYYY}/${MM}${DD}.nc"

    
MM=01
DD=01


#wget --user-agent="Mozilla/5.0" "http://database.rish.kyoto-u.ac.jp/arch/jmadata/data/gpv/netcdf/MSM-S/${YYYY}/${MM}${DD}.nc"

