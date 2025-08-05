module elogit_session_load_mod
    use elogit_data_mod
    use error_handler
    use program_constants
    use elogit_control_mod
    implicit none
    private

    public :: put_elogit_data_matrix
    public :: put_elogit_var_names
    public :: put_elogit_case_id
    character(len = 20), parameter :: modname = "elogit_data_load_mod"
    integer, parameter :: max_cases = 1000
    integer, parameter :: max_vars = 100
    integer, parameter :: case_id_length = 1024


contains

    integer(our_int) function put_elogit_data_matrix(data_matrix, &
            ncase, nvar, session, err) result(answer)
        ! Loads a data matrix into an ELOGIT session.
        ! var_names and case_id are initialized to default values.
        implicit none

        ! Input arguments
        real(kind = our_dble), intent(in) :: data_matrix(max_cases, max_vars)
        integer(kind = our_int), intent(in) :: ncase, nvar
        type(elogit_session_type), intent(inout) :: session
        type(error_type), intent(inout) :: err

        ! Locals
        integer(kind = our_int) :: ijunk
        character(len = *), parameter :: subname = "put_elogit_data_matrix"
        integer :: i, j

        ! Initialize
        answer = RETURN_FAIL
        if (ncase <= 0 .or. ncase > max_cases) goto 700
        if (nvar <= 0 .or. nvar > max_vars) goto 700

        ! Nullify the session
        if (nullify_elogit_session(session, err) == RETURN_FAIL) goto 800

        ! Populate session dataset
        session%dataset%is_null = .false.
        session%dataset%ncase = ncase
        session%dataset%nvar = nvar

        session%dataset%data_matrix(1:ncase, 1:nvar) = data_matrix(1:ncase, 1:nvar)

        call assign_default_var_names(session%dataset)
        call assign_default_case_id(session%dataset)

        answer = RETURN_SUCCESS
        return

        700     call err_handle(err, 1000, called_from = subname // " in MOD " // modname, &
                custom_1 = "Invalid dimensions or input array.")
        ijunk = nullify_elogit_session(session, err)
        return

        800     call err_handle(err, 1000, called_from = subname // " in MOD " // modname)
        ijunk = nullify_elogit_session(session, err)
    end function put_elogit_data_matrix


    function put_elogit_var_names(var_names, session, err) result(answer)
        ! Loads variable names into session. Assumes dataset is initialized.
        implicit none

        character(len = 64), intent(in) :: var_names(max_vars)
        type(elogit_session_type), intent(inout) :: session
        type(error_type), intent(inout) :: err
        integer(our_int) :: answer
        character(len = *), parameter :: subname = "put_elogit_var_names"
        integer :: ijunk

        answer = RETURN_FAIL
        if (session%dataset%is_null) goto 700
        if (session%dataset%nvar <= 0 .or. session%dataset%nvar > max_vars) goto 800

        session%dataset%var_names(1:session%dataset%nvar) = &
                var_names(1:session%dataset%nvar)

        answer = RETURN_SUCCESS
        return

        700     call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod", &
                custom_1 = "Cannot load var_names before loading data matrix.")
        return
        800     call err_handle(err, 1000, called_from = subname // " in MOD elogit_data_mod", &
                custom_1 = "Invalid number of variables or out of bounds.")
        return
    end function put_elogit_var_names

    subroutine assign_default_case_id(dataset)
        implicit none
        type(dataset_type), intent(inout) :: dataset
        character(len = 12) :: sInt
        integer(kind = our_int) :: kase

        do kase = 1, dataset%ncase
            write(sInt, "(I12)") kase
            sInt = adjustl(sInt)
            dataset%case_id(kase) = "CASE_" // trim(sInt)
        end do
    end subroutine assign_default_case_id

    function put_elogit_case_id(case_id_array, session, err) result(answer)
        ! Arguments
        character(len = *), intent(in) :: case_id_array(:)
        type(elogit_session_type), intent(inout) :: session
        type(error_type), intent(inout) :: err

        ! Locals
        integer(our_int) :: answer
        integer :: ncase, i
        character(len = *), parameter :: subname = "put_elogit_case_id"

        ! Initialize
        answer = RETURN_FAIL
        ncase = size(case_id_array)

        ! Deallocate any existing storage in dataset
        if (associated(session%dataset%case_id)) deallocate(session%dataset%case_id)

        ! Allocate with fixed length case_id_length
        allocate(character(len = 1024) :: session%dataset%case_id(ncase), stat = answer)
        if (answer /= 0) then
            call err_handle(err, 1000, &
                    called_from = subname, &
                    custom_1 = "Failed to allocate memory for case_id in dataset.")
            return
        end if

        ! Copy each case id string, truncating or padding as needed
        do i = 1, ncase
            session%dataset%case_id(i) = adjustl(case_id_array(i)(1:min(len(case_id_array(i)), case_id_length)))
        end do

        answer = RETURN_SUCCESS
    end function put_elogit_case_id

end module elogit_session_load_mod
