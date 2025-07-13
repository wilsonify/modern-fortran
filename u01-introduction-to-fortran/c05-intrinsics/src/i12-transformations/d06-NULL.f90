module showit
  implicit none
  private
  character(len=*), parameter :: g = '(*(g0,1x))'
  public :: gen

  interface gen
    module procedure s1
    module procedure s2
  end interface

contains

  subroutine s1(j, pi)
    integer, intent(in) :: j
    integer, pointer, intent(inout) :: pi
    if (associated(pi)) then
      write(*, g) 'Two integers in S1:,', j, 'and', pi
    else
      write(*, g) 'One integer in S1:,', j
    endif
  end subroutine s1

  subroutine s2(k, pr)
    integer, intent(in) :: k
    real, pointer, intent(inout) :: pr
    if (associated(pr)) then
      write(*, g) 'integer and real in S2:,', k, 'and', pr
    else
      write(*, g) 'One integer in S2:,', k
    endif
  end subroutine s2

end module showit


program demo_null
  use showit, only : gen
  implicit none

  real, target :: x = 200.0
  integer, target :: i = 100

  real, pointer :: real_ptr
  integer, pointer :: integer_ptr

  ! Declare typed null pointers explicitly
  real, pointer :: null_real_ptr => null()
  integer, pointer :: null_integer_ptr => null()

  ! Call generic procedures with disassociated (null) pointers
  call gen(1, null_real_ptr)    ! Invokes s2 (real pointer)
  call gen(2, null_integer_ptr) ! Invokes s1 (integer pointer)

  ! Associate pointers to targets
  real_ptr => x
  integer_ptr => i

  ! Call generic procedures with associated pointers
  call gen(3, real_ptr)    ! Invokes s2
  call gen(4, integer_ptr) ! Invokes s1

end program demo_null
