program test_chars_to_string
    use testing, only: assert, initialize_tests, report_tests
    use functional, only: chars_to_string, empty

    implicit none

    logical, dimension(:), allocatable :: tests
    logical :: test_failed
    integer :: n, ntests

    n = 1
    ntests = 2
    call initialize_tests(tests, ntests)

    tests(n) = assert(chars_to_string(['h', 'e', 'l', 'l', 'o']) == 'hello', &
                     'chars_to_string converts character array to string')
    n = n + 1

    tests(n) = assert(chars_to_string(empty(' ')) == '', &
                     'chars_to_string converts empty array to empty string')
    n = n + 1

    test_failed = .false.
    call report_tests(tests, test_failed)
    if (test_failed) stop 1
end program test_chars_to_string
