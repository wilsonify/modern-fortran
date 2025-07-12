program demo_ibclr
  implicit none

  integer :: x, cleared
  integer :: pos

  interface
    function binstr(x) result(s)
      integer, intent(in) :: x
      character(len=32) :: s
    end function binstr
  end interface

  ! Set initial bit pattern
  x = int(B'11110000111100001111000011110000')  ! 32-bit pattern

  print *, "Original value:"
  print *, "x      =", binstr(x)

  ! Clear bit at position 0 (LSB)
  pos = 0
  cleared = ibclr(x, pos)
  print *, "Clear bit at position 0:"
  print *, "result =", binstr(cleared)

  ! Clear bit at position 15 (middle)
  pos = 15
  cleared = ibclr(x, pos)
  print *, "Clear bit at position 15:"
  print *, "result =", binstr(cleared)

  ! Clear bit at position 31 (MSB)
  pos = 31
  cleared = ibclr(x, pos)
  print *, "Clear bit at position 31:"
  print *, "result =", binstr(cleared)

contains

  function binstr(x) result(s)
    integer, intent(in) :: x
    character(len=32) :: s
    integer :: k
    s = ''
    do k = 31, 0, -1
      if (iand(x, ishft(1, k)) /= 0) then
        s(32 - k:32 - k) = '1'
      else
        s(32 - k:32 - k) = '0'
      end if
    end do
  end function binstr

end program demo_ibclr
