module mod1
  use iso_c_binding, only: c_int, c_ptr, c_f_pointer
  use mod2, only: adder_base
  implicit none

  private
  public :: adder_c, adder_c_ptr

contains

  function adder_c(a,b) result(c) bind(c, name='adder')
    integer(c_int), value :: a, b
    integer(c_int)        :: c

    print*, 'Inside adder_c, calling adder'
    c = adder_base(a,b)
    print*, 'Finished calling adder'
    print*,


  end function adder_c

  function adder_c_ptr(a_ptr, b_ptr) result(c) bind(c, name='adder_ptr')
    type(c_ptr), value  :: a_ptr, b_ptr
    integer, pointer    :: a, b
    integer(c_int)        :: c

    print*, 'Inside adder_c_ptr'

    call c_f_pointer(a_ptr, a)
    call c_f_pointer(b_ptr, b)

    print*, 'Inside adder_c_ptr, a_ptr = ', a
    print*, 'Inside adder_c_ptr, b_ptr = ', b

    c = adder_base(a,b)

  end function adder_c_ptr

end module mod1
