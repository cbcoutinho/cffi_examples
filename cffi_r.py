import cffi
import sys

ffi =  cffi.FFI()

prefix = {'win32': ''}.get(sys.platform, 'lib')
extension = {'darwin': '.dylib', 'win32': '.dll'}.get(sys.platform, '.so')

ffi.cdef('int adder(int, int);')
clib = ffi.dlopen(prefix + 'example_r' + extension)

print('1 + 1 = ', clib.adder(1,1))
print('1 + 2 = ', clib.adder(1,2))
print('1 + 3 = ', clib.adder(1,3))

for i in range(5):
    print('1 + ', str(i), ' = ', clib.adder(1, i))
