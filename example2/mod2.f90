module mod2
  use iso_fortran_env, only: wp=>real64
  implicit none

  private
  public  :: adder_base
contains
  function adder_base(a, b) result(c)
    integer :: a, b, c

    print*, 'Inside adder'
    c = a + b
    print*, 'Finished adding'
  end function adder_base

end module mod2
