program demo_co_lbound
    implicit none
    integer, allocatable :: A[:]          ! 1D coarray
    integer, allocatable :: B[:,:]        ! 2D coarray
    integer :: lb1, lb2
    integer :: lbvec(:)

    ! Allocate coarrays
    allocate(A[*])
    allocate(B[*,*])

    ! Only the first image prints the results
    if (this_image() == 1) then
        print *, "=== CO_LBOUND Demo ==="

        ! 1D coarray lower cobound
        lb1 = co_lbound(A)
        print *, "Lower cobound of A[:]:", lb1

        ! 2D coarray lower cobounds (as a vector)
        lbvec = co_lbound(B)
        print *, "Lower cobounds of B[:,:]:", lbvec

        ! Access specific codimension (1 or 2)
        lb1 = co_lbound(B, dim=1)
        lb2 = co_lbound(B, dim=2)
        print *, "Lower cobound of B along codim=1:", lb1
        print *, "Lower cobound of B along codim=2:", lb2
    end if

    sync all  ! Ensure all images finish together
end program demo_co_lbound
