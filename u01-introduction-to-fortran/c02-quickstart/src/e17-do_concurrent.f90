program do_concurrent
    use, intrinsic :: iso_fortran_env, only : real64
    implicit none

    real(real64), parameter :: pi = 3.141592653589793d0
    integer, parameter :: n = 10
    real(real64) :: result_sin(n)
    integer :: i

    do concurrent (i = 1:n)
        result_sin(i) = sin(i * pi / 4.0_real64)
    end do

    print *, result_sin

end program do_concurrent
