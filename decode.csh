#!/bin/csh
#This sciptis decode RA grib2 file to 4-byte data file.

set YYYY=2020
foreach MM (01 02 03 04 05 06 07 08 09 10 11 12)
#foreach DD (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31)
#foreach MIN (00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23)
#foreach SS (00 30)

#make directory
 switch($MM)
    case 01:
    case 03:
    case 05:
    case 07:
    case 08:
    case 10:
    case 12:
      set  DD = (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31)
      breaksw
    case 04:
    case 06:
    case 09:
    case 11:
      set  DD = (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
      breaksw
      case 02:

      @ y = $YYYY
      if ( ( $y % 4 == 0 ) && ( ( $y % 100 != 0 ) || ( $y % 400 == 0 ) ) ) then
          set  DD = (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29)
      else
          set  DD = (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28)
          endif
          breaksw
 endsw

foreach DD ($DD)
foreach MIN (00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23)
foreach SS (00 30)
if ( -d RA_data/${YYYY}/${MM}/${DD} ) then
    echo skip making directory. this directory exist.
else
    mkdir -p RA_data/${YYYY}/${MM}/${DD}
    echo make directory RA_data/${YYYY}/${MM}/${DD}
endif
#decode
echo Z__C_RJTD_${YYYY}${MM}${DD}${MIN}${SS}00_SRF_GPV_Ggis1km_Prr60lv_ANAL_grib2.bin
grib2_dec /mnt/jet12/makoto/RA/RA_org/${YYYY}/${MM}/${DD}/Z__C_RJTD_${YYYY}${MM}${DD}${MIN}${SS}00_SRF_GPV_Ggis1km_Prr60lv_ANAL_grib2.bin

mv  /mnt/jet12/makoto/RA/RA_org/${YYYY}/${MM}/${DD}/Z__C_RJTD_${YYYY}${MM}${DD}${MIN}${SS}00_SRF_GPV_Ggis1km_Prr60lv_ANAL_0_int.bin  /mnt/jet12/makoto/RA/RA_data/${YYYY}/${MM}/${DD}/
mv  /mnt/jet12/makoto/RA/RA_data/${YYYY}/${MM}/${DD}/Z__C_RJTD_${YYYY}${MM}${DD}${MIN}${SS}00_SRF_GPV_Ggis1km_Prr60lv_ANAL_0_int.bin  /mnt/jet12/makoto/RA/RA_data/${YYYY}/${MM}/${DD}/RA_${YYYY}${MM}${DD}${MIN}${SS}00.bin

end
end
end
end
