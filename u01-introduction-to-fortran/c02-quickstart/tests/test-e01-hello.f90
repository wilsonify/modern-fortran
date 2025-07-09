! test/test-e01-hello.f90
program test_hello
  use hello_mod
  implicit none

  ! Here we call the same logic as the main program
  call say_hello()

  ! Minimal test: if it doesn't crash, it passes
  stop 0
end program test_hello
