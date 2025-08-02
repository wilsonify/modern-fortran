integer function add_suffix(file_name, suffix) result(answer)
    ! Returns 0 if operation is successful, 1 otherwise.
    implicit none
    character(len = *), intent(inout) :: file_name
    character(len = 3), intent(in) :: suffix
    integer :: i
    if(suffix(1:1)=="") goto 5 ! suffix begins with blank
    i = index(file_name, ".", back = .true.) ! look for last period
    if(i==0) i = len_trim(file_name) + 1 ! if no period was found
    if(len(file_name) < i + 3) goto 5 ! not enough room for suffix
    file_name(i:) = "." // suffix
    answer = 0 ! normal exit
    return
    5    answer = 1 ! error trap
    return
end function add_suffix
