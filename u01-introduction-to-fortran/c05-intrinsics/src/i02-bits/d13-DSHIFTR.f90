program demo_dshiftr
  implicit none

  integer :: i, j, shift, result

  interface
    function binstr(x) result(s)
      integer, intent(in) :: x
      character(len=32) :: s
    end function binstr
  end interface

  ! Example 1: shift = 4
  i = int(B'10101010101010101010101010101010')  ! Alternating bits
  j = int(B'11110000111100001111000011110000')  ! Patterned bits
  shift = 4
  result = dshiftr(i, j, shift)

  print *, "DSHIFTR DEMO:"
  print *, "i      =", binstr(i)
  print *, "j      =", binstr(j)
  print *, "shift  =", shift
  print *, "result =", binstr(result)
  print *

  ! Example 2: shift = 0 (no change)
  shift = 0
  result = dshiftr(i, j, shift)
  print *, "Shift = 0 => result =", binstr(result)

  ! Example 3: shift = 32 (for 32-bit integer)
  shift = 32
  result = dshiftr(i, j, shift)
  print *, "Shift = 32 => result =", binstr(result)

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

end program demo_dshiftr
