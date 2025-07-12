subroutine association_test(a, b)
    use iso_c_binding, only : c_associated, c_loc, c_ptr
    implicit none
    real, pointer :: a
    type(c_ptr) :: b
    if(c_associated(b, c_loc(a))) &
            stop 'b and a do not point to same target'
end subroutine association_test
program demo_c_loc
    use iso_c_binding, only : c_loc, c_ptr, c_associated
    implicit none

    real, target :: x = 3.14
    type(c_ptr) :: p

    ! Get the C address of the Fortran variable x
    p = c_loc(x)

    ! Confirm association by comparing the C pointer to x
    if (c_associated(p, c_loc(x))) then
        print *, "Success: c_loc(x) returned the address of x."
    else
        print *, "Error: c_loc(x) does not match x."
    end if

end program demo_c_loc
