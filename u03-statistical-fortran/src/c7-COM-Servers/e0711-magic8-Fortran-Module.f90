module magic8
    implicit none
    private ! by default
    public :: get_magic8_msg
    character(len = *), parameter :: modname = "magic8"
contains

    integer function get_magic8_msg(msg) result(answer)
        implicit none
        ! Generates a random message from the Magic 8-ball. The argument
        ! msg should be at least 26 characters long, otherwise the
        ! message may be truncated.
        !
        ! Because this uses the Fortran intrinsic generator, you should
        ! set the seed (e.g. by calling random_seed) before using this
        ! function.
        character(len = *), intent(out) :: msg
        ! locals
        real :: u
        integer :: i
        ! generate a random integer between 1 and 20
        call random_number(u)
        i = 20 * u + 1
        select case(i)
            ! positive responses
        case(1)
            msg = "Yes."
        case(2)
            msg = "Signs point to yes."
        case(3)
            msg = "Without a doubt."
        case(4)
            msg = "As I see it, yes."
        case(5)
            msg = "You may rely on it."
        case(6)
            msg = "It is decidedly so."
        case(7)
            msg = "Most likely."
        case(8)
            msg = "Outlook good."
        case(9)
            msg = "Yes - definitely."
        case(10)
            msg = "It is certain."
            ! negative responses
        case(11)
            msg = "My sources say no."
        case(12)
            msg = "Outlook not so good."
        case(13)
            msg = "My reply is no."
        case(14)
            msg = "Don’t count on it."
        case(15)
            msg = "Very doubtful."
            ! vague responses
        case(16)
            msg = "Concentrate and ask again."
        case(17)
            msg = "Reply hazy, try again."
        case(18)
            msg = "Better not tell you now."
        case(19)
            msg = "Cannot predict now."
        case default
            msg = "Ask again later."
        end select
        ! normal exit
        answer = 0
        return
    end function get_magic8_msg

end module magic8
