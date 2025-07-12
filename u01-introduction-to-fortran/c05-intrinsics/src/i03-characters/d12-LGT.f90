program demo_lgt
    implicit none

    character(len = 10) :: a, b
    logical :: result

    ! Example 1: same length, 'orange' > 'apple' in ASCII
    a = 'orange    '
    b = 'apple     '
    result = lgt(a, b)
    print *, "lgt('", trim(a), "', '", trim(b), "') = ", result
    ! Expect: .true. ('orange' > 'apple')

    ! Example 2: different lengths, 'dog' is padded to 'doghouse'
    a = 'dog       '
    b = 'doghouse  '
    result = lgt(a, b)
    print *, "lgt('", trim(a), "', '", trim(b), "') = ", result
    ! Expect: .false. ('dog     ' < 'doghouse')

    ! Example 3: ASCII ordering — uppercase 'Zebra' < lowercase 'apple'
    a = 'Zebra     '
    b = 'apple     '
    result = lgt(a, b)
    print *, "lgt('", trim(a), "', '", trim(b), "') = ", result
    ! Expect: .false. ('Z' < 'a' in ASCII)

    ! Example 4: equal strings — not greater
    a = 'equal     '
    b = 'equal     '
    result = lgt(a, b)
    print *, "lgt('", trim(a), "', '", trim(b), "') = ", result
    ! Expect: .false.

end program demo_lgt
