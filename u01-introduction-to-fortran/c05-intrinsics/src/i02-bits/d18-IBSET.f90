program demo_ibset
  implicit none

  integer :: x, setval
  integer :: pos

  interface
    function binstr(x) result(s)
      integer, intent(in) :: x
      character(len=32) :: s
    end function binstr
  end interface

  ! Start with zero
  x = 0

  print *, "Original value:"
  print *, "x      =", binstr(x)

  ! Set bit at position 0 (LSB)
  pos = 0
  setval = ibset(x, pos)
  print *, "Set bit at position 0:"
  print *, "result =", binstr(setval)

  ! Set bit at position 15 (middle)
  pos = 15
  setval = ibset(setval, pos)
  print *, "Set bit at position 15:"
  print *, "result =", binstr(setval)

  ! Set bit at position 31 (MSB)
  pos = 31
  setval = ibset(setval, pos)
  print *, "Set bit at position 31:"
  print *, "result =", binstr(setval)

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

end program demo_ibset
