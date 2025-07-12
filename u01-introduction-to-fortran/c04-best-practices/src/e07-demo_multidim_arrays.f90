!> Demonstrates multidimensional arrays, inverse distance matrix, and contraction.

! coulomb_matrix computes an inverse distance matrix using column-major order traversal (inner loop on rows).
!
! contract_third_dim_loop shows triple nested loops contracting the 3rd dimension of a 3D array.
!
! contract_third_dim_matmul uses a contiguous pointer remapping and matmul for efficient contraction.
!
! The demo program initializes arrays, runs computations, and prints results.
!
! The print_matrix helper subroutine prints 2D arrays in a readable format.

program e07_demo_multidim_arrays
  use, intrinsic :: iso_fortran_env, only: dp
  use multidim_array_ops
  implicit none

  integer, parameter :: n1 = 4, n2 = 3, m = 2, p = 5
  real(dp) :: xyz1(3, n1), xyz2(3, n2), a(n1, n2)
  real(dp) :: amat(m, n2, p), bvec(p), cmat(m, n2), cmat_loop(m, n2)
  integer :: i

  ! Initialize some points in 3D (xyz1 and xyz2)
  do i = 1, n1
    xyz1(:, i) = [real(i, dp), 0.0_dp, 0.0_dp]
  end do
  do i = 1, n2
    xyz2(:, i) = [0.0_dp, real(i, dp), 0.0_dp]
  end do

  ! Compute Coulomb-like inverse distance matrix
  call coulomb_matrix(xyz1, xyz2, a)
  print *, "Coulomb matrix a(:, :):"
  call print_matrix(a)

  ! Initialize 3D array and vector for contraction
  amat = 0.0_dp
  do i = 1, p
    amat(:, :, i) = real(i, dp)  ! Just fill slices with scalar i for demo
  end do
  bvec = [(real(j, dp), j = 1, p)]

  ! Contract third dimension using explicit loops
  cmat_loop = 0.0_dp
  call contract_third_dim_loop(amat, bvec, cmat_loop)
  print *, "Contracted matrix using loops:"
  call print_matrix(cmat_loop)

  ! Contract third dimension using matmul approach
  cmat = 0.0_dp
  call contract_third_dim_matmul(amat, bvec, cmat)
  print *, "Contracted matrix using matmul:"
  call print_matrix(cmat)

contains

  subroutine print_matrix(mat)
    real(dp), intent(in) :: mat(:, :)
    integer :: i, j
    do i = 1, size(mat, 1)
      write(*,'(100(F8.4,1X))') (mat(i, j), j = 1, size(mat, 2))
    end do
  end subroutine print_matrix

end program e07_demo_multidim_arrays
