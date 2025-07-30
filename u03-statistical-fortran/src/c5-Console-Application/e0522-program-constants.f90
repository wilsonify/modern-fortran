!#####################################################################
module program_constants
    ! Programming constants used throughout the ELOGIT program.
    ! Unlike most modules, everything here is public.
    implicit none
    public
    ! Define compiler-specific KIND numbers for integers,
    ! single and double-precision reals to help ensure consistency of
    ! performance across platforms:
    integer, parameter :: our_int = selected_int_kind(9), &
            our_sgle = selected_real_kind(6, 37), &
            our_dble = selected_real_kind(15, 307)
    ! Define UNIT numbers for Fortran I/O:
    integer, parameter :: ctrl_file_handle = 11
    ! Define maximum lengths for various types of character strings:
    integer, parameter :: file_name_length = 256
    ! Define the maximum line widths for various types of files:
    integer, parameter :: ctrl_line_width = 80
    ! Common integer values returned by all functions to indicate
    ! success or failure:
    integer(kind = our_int), parameter :: RETURN_SUCCESS = 0, &
            RETURN_FAIL = -1
    ! Character strings describing this program:
    character(len = *), parameter :: &
            program_name = "ELOGIT", &
            program_description = &
                    "A simple program for logistic regression analysis", &
            program_version = "Version 1.0", &
            program_version_and_date = "Version 1.0 - June, 2004", &
            program_author = "Written by J.L. Schafer", &
            program_institution_1 = &
                    "Department of Statistics and The Methodology Center", &
            program_institution_2 = "The Pennsylvania State University"
end module program_constants
!#####################################################################