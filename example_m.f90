module example
  use iso_c_binding, only: c_int

  implicit none

  private
  public :: adder_c

contains
  function adder(a, b) result(c)
    integer :: a, b, c

    print*, 'Inside adder'
    c = a + b
    print*, 'Finished adding'
  end function adder

  function adder_c(a,b) result(c) bind(c, name='adder')
    integer(c_int), value :: a, b
    integer(c_int)        :: c

    print*, 'Inside adder_c, calling adder'
    c = adder(a,b)
    print*, 'Finished calling adder'
    print*,


  end function adder_c

end module example
