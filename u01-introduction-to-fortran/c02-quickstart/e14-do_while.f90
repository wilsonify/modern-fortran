program do_while
    integer :: i

    i = 1
    do while (i < 11)
        print *, i
        i = i + 1
    end do



    do i = 1, 100
        if (i > 10) then
            exit  ! Stop printing numbers
        end if
        print *, i
    end do
    ! Here i = 11
end program do_while