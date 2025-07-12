program demo_blt
    implicit none

    integer :: a, b
    logical :: result

    ! Case 1: 1 < 2 (bitwise: B'0001' < B'0010')
    a = int(B'0001')  ! 1
    b = int(B'0010')  ! 2
    result = blt(a, b)
    print *, "blt(1, 2) =>", result, "   ! Expect TRUE"

    ! Case 2: 4 < 4 => FALSE
    a = int(B'0100')
    b = int(B'0100')
    result = blt(a, b)
    print *, "blt(4, 4) =>", result, "   ! Expect FALSE"

    ! Case 3: 7 < 5 => FALSE (bitwise: B'0111' > B'0101')
    a = int(B'0111')  ! 7
    b = int(B'0101')  ! 5
    result = blt(a, b)
    print *, "blt(7, 5) =>", result, "   ! Expect FALSE"

    ! Case 4: -1 < INT_MAX?
    a = -1
    b = int(Z'7FFFFFFF')  ! INT_MAX (signed 32-bit)
    result = blt(a, b)
    print *, "blt(-1, INT_MAX) =>", result

    ! Optional debug: print raw bit patterns
    print *, "Bits of -1      =", transfer(a, 'XXXXXXXXXXXXXXXX')
    print *, "Bits of INT_MAX =", transfer(b, 'XXXXXXXXXXXXXXXX')

    ! Case 5: BOZ literal vs integer
    result = blt(B'0001', 2)  ! B'0001' = 1, 2 = B'0010'
    print *, "blt(B'0001', 2) =>", result

end program demo_blt
