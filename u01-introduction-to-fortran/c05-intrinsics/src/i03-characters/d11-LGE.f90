program demo_lge
  implicit none

  character(len=10) :: a, b
  logical :: result

  ! Example 1: same length, straightforward ASCII comparison
  a = 'apple     '
  b = 'apricot   '
  result = lge(a, b)
  print *, "lge('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .false. ('apple' < 'apricot')

  ! Example 2: different lengths, 'cat' padded to length of 'catalog'
  a = 'cat       '
  b = 'catalog   '
  result = lge(a, b)
  print *, "lge('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .false. ('cat     ' < 'catalog  ')

  ! Example 3: ASCII ordering—'Zebra' < 'apple' because 'Z' < 'a' (uppercase < lowercase)
  a = 'Zebra     '
  b = 'apple     '
  result = lge(a, b)
  print *, "lge('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .false.

  ! Example 4: Equal strings
  a = 'hello     '
  b = 'hello     '
  result = lge(a, b)
  print *, "lge('", trim(a), "', '", trim(b), "') = ", result
  ! Expect: .true.

end program demo_lge
