program e08_demo_elementwise_root
  use kind_parameter, only: dp
  use elementwise_root_mod
  implicit none

  real(dp) :: scalar_val, scalar_res
  real(dp), allocatable :: vec(:), vec_res(:)
  real(dp), allocatable :: mat(:, :), mat_res(:, :)
  integer :: n, m

  ! Example values
  scalar_val = 9._dp
  allocate(vec(4))
  vec = [1._dp, 4._dp, 9._dp, 10._dp]
  allocate(mat(2, 2))
  mat = reshape([1._dp, 4._dp, 9._dp, 10._dp], [2, 2])

  print *, "== Elemental function (nroot_elemental) =="
  print *, "scalar:", nroot_elemental(2, scalar_val)
  print *, "vector:", nroot_elemental(2, vec)
  print *, "matrix:", nroot_elemental(2, mat)
  print *, "array n (vector) and array x (vector):", &
           nroot_elemental([2, 3, 4, 5], vec)

  print *, "== Vector function with wrappers =="

  scalar_res = nroot_0d(2, scalar_val)
  print *, "scalar wrapper (nroot_0d):", scalar_res

  vec_res = nroot_vector(2, vec)
  print *, "vector function (nroot_vector):", vec_res

  mat_res = nroot_2d(2, mat)
  print *, "2D wrapper (nroot_2d):"
  call print_matrix(mat_res)

  print *, "== Explicit-shape function (nroot_explicit) =="

  print *, "scalar as 1-element explicit array:", nroot_explicit(2, 1, [scalar_val])
  print *, "vector explicit shape:", nroot_explicit(2, 4, vec)
  print *, "matrix explicit shape reshaped as vector:"
  print *, nroot_explicit(2, 4, reshape(mat, [4]))

contains

  subroutine print_matrix(mat)
    real(dp), intent(in) :: mat(:, :)
    integer :: i, j
    do i = 1, size(mat, 1)
      write(*,'(100(F8.4,1X))') (mat(i, j), j = 1, size(mat, 2))
    end do
  end subroutine print_matrix

end program e08_demo_elementwise_root
