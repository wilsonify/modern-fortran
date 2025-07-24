program test_string_to_chars
    use testing, only : assert, initialize_tests, report_tests
    use functional, only : chars_to_string, string_to_chars, empty

    implicit none

    logical, dimension(:), allocatable :: tests
    logical :: test_failed
    integer :: n, ntests

    n = 1
    ntests = 3
    call initialize_tests(tests, ntests)

    tests(n) = assert(all(string_to_chars('hello') == ['h', 'e', 'l', 'l', 'o']), &
            'string_to_chars converts string to character array')
    n = n + 1

    tests(n) = assert(all(string_to_chars('') == empty(' ')), &
            'string_to_chars converts empty string to empty array')
    n = n + 1

    tests(n) = assert(chars_to_string(string_to_chars('hello')) == 'hello', &
            'chars_to_string(string_to_chars(string)) == string')
    n = n + 1

    test_failed = .false.
    call report_tests(tests, test_failed)
    if (test_failed) stop 1
end program test_string_to_chars
