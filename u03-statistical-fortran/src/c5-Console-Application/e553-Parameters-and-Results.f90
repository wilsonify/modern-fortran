module elogit_model_types
    implicit none
    private
    public :: param_type, results_type

    ! Define constants
    integer, parameter :: our_int = selected_int_kind(9)
    integer, parameter :: our_dble = selected_real_kind(15, 307)

    type :: param_type
        sequence
        private
        logical :: is_null = .true.
        integer(kind = our_int) :: p = 0
        real(kind = our_dble), pointer :: beta(:) => null()
    end type param_type

    type :: results_type
        sequence
        private
        logical :: is_null = .true.
        integer(kind = our_int) :: iter = 0
        logical :: converged = .false.
        real(kind = our_dble), pointer :: cov_beta(:, :) => null()
        real(kind = our_dble) :: loglik = 0.0D0, X2 = 0.0D0, G2 = 0.0D0
        integer(kind = our_int) :: df = 0
    end type results_type

end module elogit_model_types
