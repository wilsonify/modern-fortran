module x
    use iso_c_binding
    implicit none
contains
    subroutine sub(a) bind(c)
        real(c_float), intent(inout) :: a
        a = sqrt(a) + 5.0
    end subroutine sub
end module x

program demo_c_funloc
    use iso_c_binding
    use x
    implicit none
    interface
        subroutine call_fortran_with_funptr(p) bind(c, name = 'call_fortran_with_funptr')
            import :: c_funptr
            type(c_funptr), intent(in) :: p
        end subroutine
    end interface
    call call_fortran_with_funptr(c_funloc(sub))
end program demo_c_funloc
