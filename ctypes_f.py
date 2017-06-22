from ctypes import c_int, cdll, byref, c_voidp, pointer

a0 = 2
b0 = 4

a = c_int(a0)
b = c_int(b0)

lib =  cdll.LoadLibrary('./libexample_f.so')

out = lib.__example_MOD_adder(byref(a), byref(b))
print(out)
print()

out = lib.adder(a, b)
print(out)
print()

out = lib.adder_ptr(pointer(a), pointer(b))
print(out)
print()
