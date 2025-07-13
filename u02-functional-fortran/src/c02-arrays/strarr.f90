pure function strarr(string) result(array)
  !! Returns an array of len=1 characters given a string.
  character(len=*), intent(in) :: string !! Input string
  character(len=1), dimension(:), allocatable :: array
  integer :: n
  allocate(array(len(string)))
  do concurrent(n = 1:len(string))
    array(n) = string(n:n)
  enddo
end function strarr
