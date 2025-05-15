#!/bin/csh
#run before execute decode.sh

set YYYY=2020
#set MM=01
foreach MM (01 02 03 04 05 06 07 08 09 10 11 12)
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
#foreach MIN (00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23)
#foreach SS (00 30)

if ( -d RA_data/${YYYY}/${MM}/${DD} ) then
    echo skip making directory. this directory exist.
else
    mkdir -p RA_data/${YYYY}/${MM}/${DD}
    echo make directory RA_data/${YYYY}/${MM}/${DD}
endif
end
end
