!##################################################################
module program_constants
    implicit none
    public
    ! Define compiler-specific KIND numbers for integers,
    ! single and double-precision reals to help ensure consistency
    ! of performance across platforms:
    integer, parameter :: our_int = selected_int_kind(9), &
            our_sgle = selected_real_kind(6, 37), &
            our_dble = selected_real_kind(15, 307)
    ! Common integer values returned by all functions to indicate
    ! success or failure:
    integer(kind = our_int), parameter :: RETURN_SUCCESS = 0, &
            RETURN_FAIL = -1
end module program_constants
!##################################################################