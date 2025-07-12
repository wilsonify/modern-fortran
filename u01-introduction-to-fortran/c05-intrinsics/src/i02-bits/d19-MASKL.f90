program demo_maskl
  implicit none
  integer :: i
  integer, parameter :: bits = bit_size(0)

  print *, "maskl(i) for i=0 to", bits
  do i = 0, bits
    print '(i8, 1x, a)', maskl(i), binstr(maskl(i))
  end do

contains

  function binstr(x) result(s)
    integer, intent(in) :: x
    character(len=bits) :: s
    integer :: k

    s = ''
    do k = bits-1, 0, -1
      if (iand(x, ishft(1, k)) /= 0) then
        s(bits - k: bits - k) = '1'
      else
        s(bits - k: bits - k) = '0'
      end if
    end do
  end function binstr

end program demo_maskl
