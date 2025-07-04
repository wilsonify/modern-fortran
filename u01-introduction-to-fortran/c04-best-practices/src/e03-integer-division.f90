program integer_division_demo
    use, intrinsic :: iso_fortran_env, only : real64
    implicit none

    integer :: n
    real(real64) :: result_real

    ! Positive integer division examples
    n = 3
    print *, 'Integer division:'
    print *, 'n           =', n
    print *, 'n / 2       =', n / 2             ! Result is 1
    print *, 'n*(n + 1)/2 =', n*(n + 1)/2       ! Correct due to parentheses
    print *, 'n/2*(n + 1) =', n/2*(n + 1)       ! Incorrect if expecting rounding up (1 * 4 = 4)

    ! Negative integer division
    n = -3
    print *
    print *, 'Negative integer division:'
    print *, 'n           =', n
    print *, 'n / 2       =', n / 2             ! Result is -1 (rounded toward zero)

    ! Floating point division
    print *
    print *, 'Floating point conversion:'
    n = 3
    result_real = real(n, real64) / 2
    print *, 'real(n) / 2           =', result_real

    result_real = n * 1.0_real64 / 2
    print *, 'n * 1.0_dp / 2        =', result_real

    n = -3
    result_real = real(n, real64) / 2
    print *, 'real(n) / 2 (neg)     =', result_real

    result_real = n * 1.0_real64 / 2
    print *, 'n * 1.0_dp / 2 (neg)  =', result_real

end program integer_division_demo
