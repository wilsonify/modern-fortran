program demo_bge
  use, intrinsic :: ieee_arithmetic, only: ieee_support_standard
  implicit none

  integer :: a, b
  logical :: result

  ! Examples
  a = int(B'0101')    ! 5 in binary
  b = int(B'0011')    ! 3 in binary

  result = bge(a, b)
  print *, "bge(5, 3)  =>", result, "   ! B'0101' >= B'0011'"

  a = int(B'0101')    ! 5
  b = int(B'0101')    ! 5
  result = bge(a, b)
  print *, "bge(5, 5)  =>", result, "   ! Equal values"

  a = int(B'0010')    ! 2
  b = int(B'0100')    ! 4
  result = bge(a, b)
  print *, "bge(2, 4)  =>", result, "   ! B'0010' < B'0100' => .false."

  ! Sign bits matter too
  a = -1
  b = int(B'01111111111111111111111111111111')  ! largest 32-bit signed int
  result = bge(a, b)
  print *, "bge(-1, INT_MAX) =>", result

  ! Visual check: interpret bits as unsigned for context
  print *, "Binary of -1       =", transfer(a, 'XXXXXXXXXXXXXXXX')
  print *, "Binary of INT_MAX  =", transfer(b, 'XXXXXXXXXXXXXXXX')

end program demo_bge
