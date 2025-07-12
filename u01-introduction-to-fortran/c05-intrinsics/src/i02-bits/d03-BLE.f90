program demo_ble
    implicit none

    integer :: a, b
    logical :: result

    ! Case 1: 2 ≤ 3 (bitwise: B'0010' ≤ B'0011')
    a = int(B'0010')  ! 2
    b = int(B'0011')  ! 3
    result = ble(a, b)
    print *, "ble(2, 3) =>", result, "   ! Expect TRUE"

    ! Case 2: 4 ≤ 4
    a = int(B'0100')
    b = int(B'0100')
    result = ble(a, b)
    print *, "ble(4, 4) =>", result, "   ! Expect TRUE"

    ! Case 3: 5 ≤ 2 => FALSE
    a = int(B'0101')  ! 5
    b = int(B'0010')  ! 2
    result = ble(a, b)
    print *, "ble(5, 2) =>", result, "   ! Expect FALSE"

    ! Case 4: Compare -1 with INT_MAX (bitwise ordering)
    a = -1
    b = int(Z'7FFFFFFF')  ! largest signed 32-bit int
    result = ble(a, b)
    print *, "ble(-1, INT_MAX) =>", result, "   ! Bitwise comparison"

    ! Debug: show their binary layout
    print *, "Binary -1       =", transfer(a, 'XXXXXXXXXXXXXXXX')
    print *, "Binary INT_MAX  =", transfer(b, 'XXXXXXXXXXXXXXXX')

    ! Case 5: BOZ literal vs integer
    result = ble(B'0011', 5)
    print *, "ble(B'0011', 5) =>", result, "   ! B'0011' = 3, 5 = B'0101'"

end program demo_ble
