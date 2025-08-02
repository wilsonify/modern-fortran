module model_mod
    implicit none
    private
    public :: model_type, put_elogit_response
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

contains

    subroutine put_elogit_response_bycol(model, y_col, n_col)
        type(model_type), intent(inout) :: model
        integer(kind = our_int), intent(in) :: y_col, n_col
        ! Implementation here...
    end subroutine put_elogit_response_bycol

    subroutine put_elogit_response_byname(model, y_name, n_name)
        type(model_type), intent(inout) :: model
        character(len = *), intent(in) :: y_name, n_name
        ! Implementation here...
    end subroutine put_elogit_response_byname

end module model_mod
