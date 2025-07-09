!> Numerical storage size parameters for real and integer values
module kind_parameter
    implicit none
    public

    !> Double precision real numbers (64-bit, ~15 digits)
    integer, parameter :: dp = selected_real_kind(15, 307)

end module kind_parameter
