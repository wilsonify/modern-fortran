module m2_bounds
  implicit none
contains

  subroutine msub(arr)
    integer, intent(in) :: arr(:)
    print *, "MSUB: LOWER =", lbound(arr), &
             "UPPER =", ubound(arr), &
             "SIZE  =", size(arr)
  end subroutine msub

end module m2_bounds


module m2_external
  implicit none
contains

  subroutine esub(arr)
    integer, intent(in) :: arr(:)
    ! Requires explicit interface to behave correctly
    print *, "ESUB: LOWER =", lbound(arr), &
             "UPPER =", ubound(arr), &
             "SIZE  =", size(arr)
  end subroutine esub

end module m2_external


program demo_ubound
  use m2_bounds, only: msub
  use m2_external, only: esub
  implicit none

  integer :: arr(-10:10)

  print *, "MAIN: LOWER =", lbound(arr), &
           "UPPER =", ubound(arr), &
           "SIZE  =", size(arr)

  call csub(arr)
  call msub(arr)
  call esub(arr)

contains

  subroutine csub(arr)
    integer, intent(in) :: arr(:)
    print *, "CSUB: LOWER =", lbound(arr), &
             "UPPER =", ubound(arr), &
             "SIZE  =", size(arr)
  end subroutine csub

end program demo_ubound

