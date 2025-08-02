program uniform1
    ! Generates random numbers uniformly distributed between a and b
    ! Version 1
    implicit none
    integer :: i, n
    real :: a, b, u

    print "(A)", "Enter the lower and upper bounds:"
    read(*, *) a, b
    print "(A)", "How many random numbers do ya want?"
    read(*, *) n
    print "(A)", "Here they are:"

    do i = 1, n
        call random_number(u)
        print *, a + u * (b - a)
    end do
end program uniform1