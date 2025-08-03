module elogit_data_mod
    use program_constants
    use error_handler
    implicit none

    private
    public :: dataset_type, elogit_session_type
    public :: assign_default_var_names
    public :: var_name_length

    integer, parameter :: var_name_length = 64
    integer, parameter :: case_id_length = 64

    type :: dataset_type
        sequence
        logical :: is_null = .true.
        integer(kind = our_int) :: ncase = 0, nvar = 0
        real(kind = our_dble), pointer :: data_matrix(:, :) => null()
        character(len = var_name_length), pointer :: var_names(:) => null()
        character(len = case_id_length), pointer :: case_id(:) => null()
    end type dataset_type

    type :: elogit_session_type
        sequence
        logical :: is_null = .true.
        type(dataset_type) :: dataset
    end type elogit_session_type

    interface
        integer function nullify_elogit_session(session, err) result(status)
            type(elogit_session_type), intent(inout) :: session
            type(error_type), intent(inout) :: err
        end function nullify_elogit_session
    end interface

contains

    subroutine assign_default_var_names(dataset)
        type(dataset_type), intent(inout) :: dataset
        character(len = 12) :: sInt
        integer(kind = our_int) :: var

        do var = 1, dataset%nvar
            write(sInt, "(I12)") var
            sInt = adjustl(sInt)
            dataset%var_names(var) = "VAR_" // trim(sInt)
        end do
    end subroutine assign_default_var_names

    integer function nullify_elogit_session(session, err) result(status)
        implicit none
        type(elogit_session_type), intent(inout) :: session
        type(error_type), intent(inout) :: err

        integer :: stat
        status = RETURN_SUCCESS

        ! Deallocate and nullify case_id
        if (associated(session%dataset%case_id)) then
            deallocate(session%dataset%case_id, stat = stat)
            if (stat /= 0) then
                status = RETURN_FAIL
                call err_handle(err, 201, custom_1 = "Failed to deallocate case_id array", &
                        called_from = "nullify_elogit_session in elogit_data_mod")
            end if
            nullify(session%dataset%case_id)
        end if

        ! Deallocate and nullify var_names
        if (associated(session%dataset%var_names)) then
            deallocate(session%dataset%var_names, stat = stat)
            if (stat /= 0) then
                status = RETURN_FAIL
                call err_handle(err, 201, custom_1 = "Failed to deallocate var_names array", &
                        called_from = "nullify_elogit_session in elogit_data_mod")
            end if
            nullify(session%dataset%var_names)
        end if

        ! Deallocate and nullify data_matrix
        if (associated(session%dataset%data_matrix)) then
            deallocate(session%dataset%data_matrix, stat = stat)
            if (stat /= 0) then
                status = RETURN_FAIL
                call err_handle(err, 201, custom_1 = "Failed to deallocate data_matrix", &
                        called_from = "nullify_elogit_session in elogit_data_mod")
            end if
            nullify(session%dataset%data_matrix)
        end if

        ! Reset dataset flags and counters
        session%dataset%is_null = .true.
        session%dataset%ncase = 0
        session%dataset%nvar = 0

        ! Reset session flag
        session%is_null = .true.

    end function nullify_elogit_session


end module elogit_data_mod
