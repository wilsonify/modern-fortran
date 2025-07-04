module m_employee
  implicit none
  private
  public t_date, t_address, t_person, t_employee

  type :: t_date
    integer :: year, month, day
  end type

  type :: t_address
    character(len=:), allocatable :: city, road_name
    integer :: house_number
  end type

  type, extends(t_address) :: t_person
    character(len=:), allocatable :: first_name, last_name, e_mail
  end type

  type, extends(t_person) :: t_employee
    type(t_date) :: hired_date
    character(len=:), allocatable :: position
    real :: monthly_salary
  end type

end module m_employee

program e25_derived_types_inheritance
  use m_employee
  implicit none

  type(t_employee) :: employee

  ! Initialize inherited and own members
  employee%hired_date%year  = 2020
  employee%hired_date%month = 1
  employee%hired_date%day   = 20

  employee%first_name = 'John'
  employee%last_name  = 'Doe'

  employee%city         = 'London'
  employee%road_name    = 'BigBen'
  employee%house_number = 1

  employee%position       = 'Intern'
  employee%monthly_salary = 0.0

  ! Print output for test verification
  print *, "Employee:", employee%first_name, employee%last_name
  print *, "Location:", employee%city, employee%road_name, employee%house_number
  print *, "Hired:", employee%hired_date%year, "-", employee%hired_date%month, "-", employee%hired_date%day
  print *, "Position:", employee%position
  print *, "Salary:", employee%monthly_salary

end program e25_derived_types_inheritance
