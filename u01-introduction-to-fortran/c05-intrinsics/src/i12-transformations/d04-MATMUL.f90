program demo_matmul
    implicit none
    real :: matrix_a(2,3)
    real :: matrix_b(3,2)
    real :: result(2,2)

    ! Initialize matrix_a (2x3)
    matrix_a = reshape([1.0, 2.0, 3.0, &
                        4.0, 5.0, 6.0], shape(matrix_a))

    ! Initialize matrix_b (3x2)
    matrix_b = reshape([7.0, 8.0, &
                        9.0, 10.0, &
                        11.0, 12.0], shape(matrix_b))

    ! Perform matrix multiplication
    result = matmul(matrix_a, matrix_b)

    ! Print matrices and result
    print *, "Matrix A (2x3):"
    print *, matrix_a

    print *, "Matrix B (3x2):"
    print *, matrix_b

    print *, "Result of matmul(A, B) (2x2):"
    print *, result

end program demo_matmul
