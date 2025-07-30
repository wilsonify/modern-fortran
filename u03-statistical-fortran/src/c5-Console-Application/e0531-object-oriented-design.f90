module elogit_data_mod
    implicit none
    private

    public :: dataset_type, elogit_session_type
    integer, parameter :: our_int = selected_int_kind(9)
    integer, parameter :: our_dble = selected_real_kind(15, 307)
    integer, parameter :: var_name_length = 64
    integer, parameter :: case_id_length = 64

    type :: dataset_type
        sequence
        private
        logical :: is_null = .true.
        integer(kind = our_int) :: ncase = 0, nvar = 0
        real(kind = our_dble), pointer :: data_matrix(:, :) => null()
        character(len = var_name_length), pointer :: var_names(:) => null()
        character(len = case_id_length), pointer :: case_id(:) => null()
    end type dataset_type

    type :: elogit_session_type
        sequence
        private
        logical :: is_null = .true.
        type(dataset_type) :: dataset
    end type elogit_session_type
end module elogit_data_mod
