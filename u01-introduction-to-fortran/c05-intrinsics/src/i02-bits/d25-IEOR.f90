program demo_ieor
  implicit none
  integer :: i, j, result
  integer, parameter :: bits = bit_size(0)

  interface
    function binstr(x) result(s)
      integer, intent(in) :: x
      character(len=bits) :: s
    end function binstr
  end interface

  ! Sample pairs to demonstrate bitwise XOR
  integer, dimension(5) :: a = [0, 15, 170, -1, 123456]
  integer, dimension(5) :: b = [0, 240, 85,  0, 654321]

  print '(A)', ' i (dec)   j (dec)   i (bin)                      j (bin)                      i XOR j (dec)   i XOR j (bin)'
  do i = 1, 5
    result = ieor(a(i), b(i))
    print '(I8, I9, 2X, A, 2X, A, 2X, I12, 2X, A)', a(i), b(i), binstr(a(i)), binstr(b(i)), result, binstr(result)
  end do

contains

  function binstr(x) result(s)
    integer, intent(in) :: x
    character(len=bits) :: s
    integer :: k
    s = ''
    do k = bits-1, 0, -1
      if (iand(x, ishft(1,k)) /= 0) then
        s(bits - k: bits - k) = '1'
      else
        s(bits - k: bits - k) = '0'
      end if
    end do
  end function binstr

end program demo_ieor
