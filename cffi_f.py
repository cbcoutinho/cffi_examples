import cffi

ffi =  cffi.FFI()

clib = ffi.dlopen('libexample_f.so')
ffi.cdef('int adder(int, int);')

print('1 + 1 = ', clib.adder(1,1))
print('1 + 2 = ', clib.adder(1,2))
print('1 + 3 = ', clib.adder(1,3))

for i in range(5):
    print('1 + ', str(i), ' = ', clib.adder(1, i))
