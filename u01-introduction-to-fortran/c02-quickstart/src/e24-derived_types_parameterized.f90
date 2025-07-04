module m_matrix
  implicit none
  private

  ! Parameterized derived type for a matrix
  type, public :: t_matrix(rows, cols, k)
    integer, len :: rows, cols
    integer, kind :: k = kind(0.0)
    real(kind=k), dimension(rows, cols) :: values
  end type

end module m_matrix

program e24_derived_types_parameterized
  use m_matrix
  implicit none

  ! Declare a 5x5 matrix with default kind (kind(0.0))
  type(t_matrix(rows=5, cols=5)) :: m
  integer :: i, j

  ! Fill the matrix without trying to use m%k at runtime
  do i = 1, m%rows
    do j = 1, m%cols
      m%values(i,j) = real(i + j, kind=kind(0.0))
    end do
  end do

  print *, "Matrix size:", m%rows, "x", m%cols
  print *, "Matrix values (row 1):", m%values(1, :)

end program e24_derived_types_parameterized
