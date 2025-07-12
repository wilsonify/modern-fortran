program demo_findloc
  implicit none
  integer :: idx1(1), idx2(1), idx3(2)
  integer :: arr1(4) = [2, 6, 4, 6]
  logical :: msk1(4) = [.true., .false., .false., .true.]

  integer :: mat(3, 4)
  logical :: msk2(3, 4)
  integer :: dim_result_1(4), dim_result_2(3)

  ! Initialize 2D array
  mat = reshape([ &
       0, -5,  7, 7, &
       3,  4, -1, 2, &
       1,  5,  6, 7], shape=[3,4])

  ! Initialize corresponding mask
  msk2 = reshape([ &
      .true., .true., .false., .true., &
      .true., .true., .false., .true., &
      .true., .true., .false., .true.], shape=[3,4])

  print *, "== Case (i): Basic 1D findloc =="
  idx1 = findloc(arr1, value=6)
  print *, "First 6 in [2,6,4,6] is at index:", idx1
  idx2 = findloc(arr1, value=6, back=.true.)
  print *, "Last 6 in [2,6,4,6] is at index:", idx2

  print *, ""
  print *, "== Case (ii): With 2D array and mask =="
  idx3 = findloc(mat, value=7, mask=msk2)
  print *, "First 7 under mask is at:", idx3
  idx3 = findloc(mat, value=7, mask=msk2, back=.true.)
  print *, "Last 7 under mask is at:", idx3

  print *, ""
  print *, "== Case (iii): With dim argument =="
  ! Findloc with dim=1 (find first 2 down each column)
  dim_result_1 = findloc(mat, value=2, dim=1)
  print *, "First 2 in each column (dim=1):", dim_result_1
  ! Findloc with dim=2 (find first 2 across each row)
  dim_result_2 = findloc(mat, value=2, dim=2)
  print *, "First 2 in each row (dim=2):", dim_result_2

end program demo_findloc
