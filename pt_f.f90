function func2(arg) bind(c)
   use iso_c_binding
   implicit none
   type(c_ptr), value :: arg
   type(c_ptr) :: func2
   integer(kind=C_INTPTR_T) :: address

   integer*4, pointer :: fptr

   address = transfer(arg, address)
   write(*,'("inside func2 - address: ", "0x", Z12.12)') address

   ! **** create fortran pointer from c-pointer and output the value that is pointed to
   call c_f_pointer(arg, fptr)
   write(*,'("inside func2 - value:   ", i0)') fptr
   ! ****

   func2 = c_null_ptr

end function


program pointertest
  use iso_c_binding

  interface
    subroutine func() bind(c)
     use iso_c_binding
     implicit none
     end subroutine
  end interface


  call func()

  call sleep(5)

end program
