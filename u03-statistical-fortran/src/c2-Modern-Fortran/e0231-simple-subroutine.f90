subroutine fill_with_uniforms(vec_len, vec, lower, upper)
    ! Fills the rank-one array vec with random numbers uniformly
    ! distributed from lower to upper
    implicit none
    ! declare arguments
    integer, intent(in) :: vec_len
    real, intent(in) :: lower, upper
    real, intent(out) :: vec(vec_len)
    ! begin
    call random_number(vec)
    vec = lower + vec * (upper - lower)
end subroutine fill_with_uniforms


program uniform3
    ! Generates random numbers uniformly distributed between a and b
    ! Version 3
    implicit none
    integer :: i, n
    real :: a, b
    real, allocatable :: x(:)
    print "(A)", "Enter the lower and upper bounds:"
    read(*, *) a, b
    print "(A)", "How many random numbers do ya want?"
    read(*, *) n
    allocate(x(n))
    call fill_with_uniforms(n, x, a, b)
    print "(A)", "Here they are:"

    do i = 1, n
        print *, x(i)
    end do
    deallocate(x) ! not really necessary
end program uniform3
