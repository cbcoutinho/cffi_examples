from __future__ import print_function
from ctypes import c_int, cdll, byref, c_voidp, pointer

a0 = 2
b0 = 4

a = c_int(a0)
b = c_int(b0)

#lib =  cdll.LoadLibrary('./libmod.so')
lib =  cdll.LoadLibrary('mod.dll')

out = lib.__mod2_MOD_adder_base(byref(a), byref(b))
print(out)
print()

out = lib.adder(a, b)
print(out)
print()

out = lib.adder_ptr(pointer(a), pointer(b))
print(out)
print()
