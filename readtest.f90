      program readtest
      implicit none
      real::var
      integer, parameter::nx=721,ny=577,nz=17
      integer::ix,jy,kz,unit_number,rec
      character(2)::MM, DD, HH
      character(4)::YYYY
      character(len=100)::datapath

      !open file
      if (command_argument_count() /= 4) then
             print *, 'Usage: ./convert YYYY MM DD HH'
             stop
      endif

      call get_command_argument(1, YYYY)
      call get_command_argument(2, MM)
      call get_command_argument(3, DD)
      call get_command_argument(4, HH)


      datapath='data/5km/'//'/'//YYYY//'/'//'fcat_prs_TMP_'&
      &//YYYY//MM//DD//HH//'.bin'

      open(newunit=unit_number,file=trim(datapath)&
          &,access='direct', form='unformatted',&
          & recl=4,status='old')

      print '(A100)', 'datapath'

      !read data
      rec=0
      do kz =1,nz
        do jy=1,ny
          do ix=1,nx
            rec=rec+1
            read(unit_number,rec=rec)var
            write(*,*)var,ix,jy,kz
          enddo
        enddo
      enddo

      close(unit_number)

      endprogram readtest



