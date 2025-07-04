program floating_point_demo
    use, intrinsic :: iso_fortran_env, only : real32, real64
    use kind_parameter
    implicit none

    real(real32) :: x_single
    real(dp)     :: x_double, a, b, c
    real(dp)     :: int_div_as_real, alt_div

    ! Assign single precision value
    x_single = 3.14159

    ! Assign double precision constants using kind suffix
    a = 1.0_dp
    b = 3.5_dp
    c = 1.34e8_dp

    ! Safe integer assignment to floating point
    x_double = 3

    ! Convert integer division to floating point
    int_div_as_real = real(3, dp) / 4
    alt_div         = 3 * 1.0_dp / 4

    ! Print results with full precision
    print '(a, es24.16e3)', 'Single precision x_single = ', x_single
    print '(a, es24.16e3)', 'Double precision x_double = ', x_double
    print '(a, es24.16e3)', 'a = ', a
    print '(a, es24.16e3)', 'b = ', b
    print '(a, es24.16e3)', 'c = ', c
    print '(a, es24.16e3)', '3 / 4 (real conversion) = ', int_div_as_real
    print '(a, es24.16e3)', '3 * 1.0_dp / 4 = ', alt_div

end program floating_point_demo
