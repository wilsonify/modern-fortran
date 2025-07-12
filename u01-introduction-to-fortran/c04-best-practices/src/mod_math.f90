!> Mathematical operations module
! This declares a public interface to sum_of_squares, but no implementation.
! We’ll implement it in a submodule, enabling faster compilation and clear separation.

module mod_math
  implicit none
  private

  public :: sum_of_squares

  interface sum_of_squares
    module function sum_sq(arr) result(res)
      real, intent(in) :: arr(:)
      real :: res
    end function sum_sq
  end interface sum_of_squares

end module mod_math
