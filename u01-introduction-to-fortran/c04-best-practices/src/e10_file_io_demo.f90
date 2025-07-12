! This program:
! Reads from an input file: data/input/log.txt
!
! Writes data to a file using status="replace"
!
!    Appends additional data using position="append"
!
!    Reads and echoes the data back
!
!    Handles errors with iostat and iomsg
!
!    Uses inquire to check for file existence
!
!    Uses a scratch file as temporary storage
program e10_file_io_demo
  implicit none
  integer, parameter :: dp = kind(1.0d0)

  character(len=*), parameter :: input_file  = "data/input/log.txt"
  character(len=*), parameter :: output_file = "data/output/output.txt"

  integer :: io_in, io_out, stat
  character(len=512) :: msg
  logical :: exists
  character(len=256) :: line

  ! Check if input file exists
  inquire(file=input_file, exist=exists)
  if (.not. exists) then
    print *, "Input file does not exist: ", trim(input_file)
    stop 1
  end if

  ! Open input file for reading with error handling
  open(newunit=io_in, file=input_file, status="old", action="read", iostat=stat, iomsg=msg)
  if (stat /= 0) then
    print *, "Failed to open input file: ", trim(msg)
    stop 1
  end if

  ! Open output file for writing (replace or create) with error handling
  open(newunit=io_out, file=output_file, status="replace", action="write", iostat=stat, iomsg=msg)
  if (stat /= 0) then
    print *, "Failed to open output file: ", trim(msg)
    close(io_in)
    stop 1
  end if

  print *, "Reading from ", trim(input_file), " and writing to ", trim(output_file)

  ! Read input file line-by-line and write to output file
  do
    read(io_in, '(A)', iostat=stat) line
    if (stat /= 0) exit
    write(io_out, '(A)') trim(line)
  end do

  ! Close files
  close(io_in)
  close(io_out)

  print *, "File processing complete."

end program e10_file_io_demo
