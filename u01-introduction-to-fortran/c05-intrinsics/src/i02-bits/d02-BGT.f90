program demo_bgt
  implicit none

  integer :: a, b
  logical :: result

  ! Test 1: 5 > 3 in binary
  a = int(B'0101')    ! 5
  b = int(B'0011')    ! 3
  result = bgt(a, b)
  print *, "bgt(5, 3)  =>", result, "   ! B'0101' > B'0011'"

  ! Test 2: 5 > 5 => false
  a = int(B'0101')
  b = int(B'0101')
  result = bgt(a, b)
  print *, "bgt(5, 5)  =>", result, "   ! Equal bit patterns"

  ! Test 3: 2 > 4 => false
  a = int(B'0010')
  b = int(B'0100')
  result = bgt(a, b)
  print *, "bgt(2, 4)  =>", result

  ! Test 4: -1 (all 1s) vs INT_MAX
  a = -1
  b = int(Z'7FFFFFFF')  ! 32-bit signed max
  result = bgt(a, b)
  print *, "bgt(-1, INT_MAX) =>", result

  ! Display binary representation using transfer (debug)
  print *, "Binary -1       =", transfer(a, 'XXXXXXXXXXXXXXXX')
  print *, "Binary INT_MAX  =", transfer(b, 'XXXXXXXXXXXXXXXX')

  ! Test 5: Mixing BOZ literal with integer
  result = bgt(B'1111', 5)
  print *, "bgt(B'1111', 5) =>", result

end program demo_bgt
