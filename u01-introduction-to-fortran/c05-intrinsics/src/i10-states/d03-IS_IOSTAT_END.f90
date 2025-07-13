program demo_iostat_fileio
    implicit none
    integer :: ios, inunit, outunit
    real :: value
    character(len=256) :: message
    character(len=*), parameter :: infile = 'data/input/log.txt'
    character(len=*), parameter :: outfile = 'data/output/results.txt'

    ! Open input file for reading
    open(newunit=inunit, file=infile, status='old', action='read', iostat=ios, iomsg=message)
    if (ios /= 0) then
        write(*, *) 'Error opening input file:', trim(message)
        stop
    end if

    ! Open output file for writing (create or overwrite)
    open(newunit=outunit, file=outfile, status='replace', action='write', iostat=ios, iomsg=message)
    if (ios /= 0) then
        write(*, *) 'Error opening output file:', trim(message)
        close(inunit)
        stop
    end if

    do
        read(inunit, *, iostat=ios, iomsg=message) value
        if (ios == 0) then
            write(outunit, '(A, F8.3)') 'VALUE= ', value
        else if (ios == -1) then   ! EOF detected
            write(outunit, *) 'End of file reached. Goodbye!'
            exit
        else
            write(outunit, '(A, I0, A)') 'ERROR: ', ios, ' ', trim(message)
            exit
        end if
    end do

    close(inunit)
    close(outunit)

end program demo_iostat_fileio
