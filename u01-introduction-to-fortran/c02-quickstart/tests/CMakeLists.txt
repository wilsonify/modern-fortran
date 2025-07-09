foreach(
test_e01_hello.f90
  )
  add_executable(test_${execid} test_${execid}.f90)
  target_link_libraries(test_${execid} PRIVATE neural-fortran ${LIBS})

  add_test(NAME test_${execid} COMMAND test_${execid})
endforeach()
