program demo_rrspacing
    implicit none
    real :: x, result

    ! Choose a sample value
    x = 10.0

    ! Compute the reciprocal of the relative spacing near x
    result = rrspacing(x)

    ! Output the result and verify the relationship
    print *, "x                = ", x
    print *, "fraction(x)      = ", fraction(x)
    print *, "radix(x)         = ", radix(x)
    print *, "digits(x)        = ", digits(x)
    print *, "rrspacing(x)     = ", result
    print *, "expected value   = ", abs(fraction(x)) * real(radix(x))**digits(x)

end program demo_rrspacing
