program demo_ishftc
  implicit none
  integer :: i, result, shift, size
  integer, parameter :: bits = bit_size(0)
  character(len=bits) :: bin_i, bin_res

  interface
    function binstr(x) result(s)
      integer, intent(in) :: x
      character(len=bits) :: s
    end function binstr
  end interface

  i = Z'F0F0F0F0'  ! Example pattern: 11110000111100001111000011110000 (hexadecimal)
  size = 16         ! Circular shift on 16 bits (rightmost 16 bits)

  print '(A)', 'i (decimal)   shift   size    i (bin)               ishftc result (dec)   result (bin)'
  do shift = -17, 17, 5
    ! Perform circular shift only if abs(shift) < size (otherwise skip)
    if (abs(shift) < size) then
      result = ishftc(i, shift, size)
      bin_i = binstr(i)
      bin_res = binstr(result)
      print '(I12, 5X, I5, 5X, I5, 5X, A, 5X, I18, 5X, A)', i, shift, size, bin_i, result, bin_res
    end if
  end do

contains

  function binstr(x) result(s)
    integer, intent(in) :: x
    character(len=bits) :: s
    integer :: k
    s = ''
    do k = bits - 1, 0, -1
      if (iand(x, ishft(1, k)) /= 0) then
        s(bits - k : bits - k) = '1'
      else
        s(bits - k : bits - k) = '0'
      end if
    end do
  end function binstr

end program demo_ishftc
