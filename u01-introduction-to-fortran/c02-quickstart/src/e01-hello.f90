! e01-hello.f90
module hello_mod
contains
    subroutine say_hello
        print *, "Hello, World!"
    end subroutine say_hello
end module hello_mod

program hello
    ! This is a comment line; it is ignored by the compiler
    use hello_mod
    call say_hello
end program hello
