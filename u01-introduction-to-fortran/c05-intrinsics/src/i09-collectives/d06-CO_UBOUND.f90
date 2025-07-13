program demo_co_ubound
    implicit none
    integer, allocatable :: A[:]           ! 1D coarray
    integer, allocatable :: B[:,:]         ! 2D coarray
    integer :: ub1, ub2
    integer :: ubvec(:)

    ! Allocate coarrays
    allocate(A[*])
    allocate(B[*,*])

    ! Run only on image 1 for clean output
    if (this_image() == 1) then
        print *, "=== CO_UBOUND Demo ==="

        ! Upper cobound of 1D coarray
        ub1 = co_ubound(A)
        print *, "Upper cobound of A[:]:", ub1

        ! Upper cobounds of 2D coarray
        ubvec = co_ubound(B)
        print *, "Upper cobounds of B[:,:]:", ubvec

        ! Individual codimensions
        ub1 = co_ubound(B, dim=1)
        ub2 = co_ubound(B, dim=2)
        print *, "Upper cobound of B along codim=1:", ub1
        print *, "Upper cobound of B along codim=2:", ub2
    end if

    sync all
end program demo_co_ubound
