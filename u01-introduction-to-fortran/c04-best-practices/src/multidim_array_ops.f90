!> Multidimensional array operations demonstrating column-major ordering and contraction.
module multidim_array_ops
    use kind_parameter, only : dp
    implicit none
    private

    public :: coulomb_matrix, contract_third_dim_loop, contract_third_dim_matmul

contains

    !> Compute inverse distance matrix between two point sets
    subroutine coulomb_matrix(xyz1, xyz2, a)
        real(dp), intent(in) :: xyz1(:, :)   ! shape (3, n1), points in 3D
        real(dp), intent(in) :: xyz2(:, :)   ! shape (3, n2)
        real(dp), intent(out) :: a(:, :)     ! shape (n1, n2)
        integer :: i, j

        do i = 1, size(a, 2)
            do j = 1, size(a, 1)
                a(j, i) = 1.0_dp / norm2(xyz1(:, j) - xyz2(:, i))
            end do
        end do
    end subroutine coulomb_matrix

    !> Euclidean norm of vector (helper function)
    pure function norm2(vec) result(res)
        real(dp), intent(in) :: vec(:)
        real(dp) :: res
        res = sqrt(sum(vec**2))
    end function norm2


    !> Contract third dimension of 3D array explicitly with loops
    subroutine contract_third_dim_loop(amat, bvec, cmat)
        real(dp), intent(in) :: amat(:, :, :)  ! shape (m, n, p)
        real(dp), intent(in) :: bvec(:)         ! length p
        real(dp), intent(inout) :: cmat(:, :)  ! shape (m, n)
        integer :: i, j, k

        ! Initialize cmat to zero to accumulate sums
        cmat = 0.0_dp

        do i = 1, size(amat, 3)
            do j = 1, size(amat, 2)
                do k = 1, size(amat, 1)
                    cmat(k, j) = cmat(k, j) + amat(k, j, i) * bvec(i)
                end do
            end do
        end do
    end subroutine contract_third_dim_loop

    !> Contract third dimension of 3D array using matrix-vector multiplication
    subroutine contract_third_dim_matmul(amat, bvec, cmat)
        real(dp), contiguous, intent(in), target :: amat(:, :, :)
        real(dp), intent(in) :: bvec(:)
        real(dp), contiguous, intent(inout), target :: cmat(:, :)
        real(dp), pointer :: aptr(:, :)
        real(dp), pointer :: cptr(:)

        aptr(1:size(amat, 1) * size(amat, 2), 1:size(amat, 3)) => amat
        cptr(1:size(cmat)) => cmat

        cptr = matmul(aptr, bvec)
    end subroutine contract_third_dim_matmul

end module multidim_array_ops
