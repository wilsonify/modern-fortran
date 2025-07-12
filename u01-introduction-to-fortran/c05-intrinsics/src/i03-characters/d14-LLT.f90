program demo_llt
  implicit none

  character(len=10) :: a, b
  logical :: result

  ! Example 1: Simple ASCII comparison, 'apple' < 'banana'
  a = 'apple     '
  b = 'banana    '
  result = llt(a, b)
  print *, "llt('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .true. ('apple' < 'banana')

  ! Example 2: Padding effect, 'cat' < 'catalog'
  a = 'cat       '
  b = 'catalog   '
  result = llt(a, b)
  print *, "llt('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .true. ('cat     ' < 'catalog')

  ! Example 3: ASCII ordering — lowercase > uppercase
  a = 'Apple     '
  b = 'banana    '
  result = llt(a, b)
  print *, "llt('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .true. ('A' < 'b' in ASCII)

  ! Example 4: Equal strings — not less
  a = 'mirror    '
  b = 'mirror    '
  result = llt(a, b)
  print *, "llt('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .false.

end program demo_llt
