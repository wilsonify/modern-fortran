
module my_mod
    ! A simple module that contains one subroutine
contains

    subroutine fill_with_uniforms(vec, lower, upper)
        ! Fills the rank-one array vec with random numbers uniformly
        ! distributed from lower to upper, which default to 0.0 and 1.0
        implicit none
        real, intent(out) :: vec(:)
        real, intent(in), optional :: lower, upper
        real :: a, b

        ! Assign default bounds
        a = 0.0
        b = 1.0

        if (present(lower)) a = lower
        if (present(upper)) b = upper

        ! Generate and transform
        call random_number(vec)
        vec = a + vec * (b - a)
    end subroutine fill_with_uniforms

end module my_mod



program uniform4
    ! Generates random numbers uniformly distributed between a and b
    use my_mod
    implicit none

    integer :: i, n
    real :: a, b
    real, allocatable :: x(:)

    print "(A)", "Enter the lower and upper bounds:"
    read(*, *) a, b
    if (a >= b) then
        print *, "Error: lower bound must be less than upper bound."
        stop
    end if

    print "(A)", "How many random numbers do ya want?"
    read(*, *) n
    if (n <= 0) then
        print *, "Error: number of values must be positive."
        stop
    end if

    allocate(x(n))
    call fill_with_uniforms(x, a, b)

    print "(A)", "Here they are:"
    do i = 1, n
        print "(F8.4)", x(i)
    end do
    deallocate(x)

end program uniform4
