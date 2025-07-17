module mod_str
    use iso_fortran_env, only : i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128
    implicit none
    public chars_to_string
    public string_to_chars
contains

    pure function chars_to_string(array) result(string)
        !! Returns a string given an array of len=1 characters.
        character(len = 1), dimension(:), intent(in) :: array !! Input array
        character(len = :), allocatable :: string
        integer :: n
        allocate(character(len = size(array)) :: string)
        do concurrent(n = 1:size(array))
            string(n:n) = array(n)
        enddo
    end function chars_to_string

    pure function string_to_chars(string) result(array)
        !! Returns an array of len=1 characters given a string.
        character(len = *), intent(in) :: string !! Input string
        character(len = 1), dimension(:), allocatable :: array
        integer :: n
        allocate(array(len(string)))
        do concurrent(n = 1:len(string))
            array(n) = string(n:n)
        enddo
    end function string_to_chars


end module mod_str