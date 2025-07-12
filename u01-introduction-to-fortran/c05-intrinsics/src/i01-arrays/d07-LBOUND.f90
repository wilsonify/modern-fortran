module m_bounds
  implicit none
contains

  subroutine msub(arr)
    integer, intent(in) :: arr(:)
    print *, "MSUB: LOWER =", lbound(arr), &
             "UPPER =", ubound(arr), &
             "SIZE  =", size(arr)
  end subroutine msub

end module m_bounds


module m_external
  implicit none
contains

  subroutine esub(arr)
    integer, intent(in) :: arr(:)
    ! Will behave correctly only if interface is visible to caller
    print *, "ESUB: LOWER =", lbound(arr), &
             "UPPER =", ubound(arr), &
             "SIZE  =", size(arr)
  end subroutine esub

end module m_external


program demo_lbound
  use m_bounds, only: msub
  use m_external, only: esub
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

end program demo_lbound

