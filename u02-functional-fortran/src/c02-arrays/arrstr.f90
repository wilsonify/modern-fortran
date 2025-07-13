pure function arrstr(array) result(string)
  !! Returns a string given an array of len=1 characters.
  character(len=1), dimension(:), intent(in) :: array !! Input array
  character(len=:), allocatable :: string
  integer :: n
  allocate(character(len=size(array)) :: string)
  do concurrent(n = 1:size(array))
    string(n:n) = array(n)
  enddo
end function arrstr