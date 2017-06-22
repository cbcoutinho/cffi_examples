import sys
import cffi

ffi =  cffi.FFI()

prefix = {'win32': ''}.get(sys.platform, 'lib')
extension = {'darwin': '.dylib', 'win32': '.dll'}.get(sys.platform, '.so')

ffi.cdef('int adder(int, int);')
clib = ffi.dlopen(prefix + 'example_f' + extension)

for i in range(3):
    print('1 + ', str(i), ' = ', clib.adder(1, i))

a = ffi.new("int *")
b = ffi.new("int *")
a[0] = 1
b[0] = 3

# for i in [a, b]:
#     print('i = ', i, ', i[0] = ', i[0])

print(str(a[0]), ' + ', str(b[0]), ' = ', clib.adder(a[0], b[0]))

ffi.cdef('int adder_ptr(int *, int *);')
print(str(a[0]), ' + ', str(b[0]), ' = ', clib.adder_ptr(a, b))
