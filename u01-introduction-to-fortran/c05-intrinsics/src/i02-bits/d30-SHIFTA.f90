program demo_shifta
  implicit none
  integer :: i, result, shift
  integer, parameter :: bits = bit_size(0)
  character(len=bits) :: bin_i, bin_res

  interface
    function binstr(x) result(s)
      integer, intent(in) :: x
      character(len=bits) :: s
    end function binstr
  end interface

  ! Test value: negative and positive examples
  integer, dimension(2) :: test_values = [ -123456789, 123456789 ]

  print '(A)', 'i (decimal)    shift    i (bin)                     shifta result (dec)    result (bin)'
  do i = 1, 2
    do shift = 0, bits - 1, bits / 4
      bin_i = binstr(test_values(i))
      result = shifta(test_values(i), shift)
      bin_res = binstr(result)
      print '(I13, 8X, I5, 5X, A, 8X, I20, 5X, A)', test_values(i), shift, bin_i, result, bin_res
    end do
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

end program demo_shifta
