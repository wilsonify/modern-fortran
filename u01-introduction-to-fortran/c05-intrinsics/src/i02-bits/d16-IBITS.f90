program demo_ibits
  implicit none

  integer :: x, result
  integer :: pos, len

  interface
    function binstr(x) result(s)
      integer, intent(in) :: x
      character(len=32) :: s
    end function binstr
  end interface

  ! Set value with known bit pattern
  x = int(B'11110000111100001111000011110000')  ! 32-bit pattern

  print *, "Original:"
  print *, "x      =", binstr(x)

  ! Example 1: Extract 8 bits from position 0 (LSB)
  pos = 0
  len = 8
  result = ibits(x, pos, len)
  print *, "Extract 8 bits from pos 0:"
  print *, "result =", binstr(result)

  ! Example 2: Extract 8 bits from position 8
  pos = 8
  len = 8
  result = ibits(x, pos, len)
  print *, "Extract 8 bits from pos 8:"
  print *, "result =", binstr(result)

  ! Example 3: Extract 4 bits from position 28 (MSBs)
  pos = 28
  len = 4
  result = ibits(x, pos, len)
  print *, "Extract 4 bits from pos 28:"
  print *, "result =", binstr(result)

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

end program demo_ibits
