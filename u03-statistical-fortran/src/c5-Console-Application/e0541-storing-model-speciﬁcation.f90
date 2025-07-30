module model_mod
    implicit none
    private
    public :: model_type
    integer, parameter :: our_int = selected_int_kind(9)

    type :: model_type
        sequence
        private
        logical :: is_null = .true.
        integer(kind = our_int) :: y_col = 0, n_col = 0, npred = 0
        logical :: grouped = .false., intercept_present = .true.
        integer(kind = our_int), pointer :: pred_col(:) => null()
    end type model_type

    interface put_elogit_response
        module procedure put_elogit_response_bycol
        module procedure put_elogit_response_byname
    end interface
end module model_mod
