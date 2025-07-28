! Generates random numbers uniformly distributed between a and b
! Version 2
program uniform2
    implicit none
    integer :: i, n
    real :: a, b
    real, allocatable :: x(:)
    print "(A)", "Enter the lower and upper bounds:"
    read(*, *) a, b
    print "(A)", "How many random numbers do ya want?"
    read(*, *) n
    allocate(x(n))
    call random_number(x)
    x = a + x * (b - a)
    print "(A)", "Here they are:"
    do i = 1, n
        print *, x(i)
    end do
    deallocate(x) ! not really necessary
end program uniform2