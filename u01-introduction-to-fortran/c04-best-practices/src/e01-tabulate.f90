module user_functions
    implicit none
contains

    real function f(x)
        real, intent(in) :: x
        f = x - x**2 + sin(x)
    end function f

end module user_functions

program tabulate_function
    use user_functions
    implicit none

    integer :: i, num_points
    real :: x, x_start, x_end, dx

    x_start = 0.0
    x_end = 5.0
    num_points = 50
    dx = (x_end - x_start) / (num_points - 1)

    print *, '   x         f(x)'
    print *, '-------------------'
    do i = 0, num_points - 1
        x = x_start + i * dx
        print '(F6.2, 3X, F8.5)', x, f(x)
    end do

end program tabulate_function
