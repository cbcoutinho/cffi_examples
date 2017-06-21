
FF=gfortran

default: all

all: libexample_f.so libexample_r.so

libexample_f.so: example_m.f90
	$(FF) -shared $< -fPIC -o $@
	rm example.mod

libexample_r.so: example/src/lib.rs
	cd example && cargo build

python_f: libexample_f.so cffi_f.py
	LD_LIBRARY_PATH=. python3 cffi_f.py

python_r: libexample_r.so cffi_r.py
	LD_LIBRARY_PATH=example/target/debug python3 cffi_r.py

clean:
	rm -f example.mod libexample*.so
	cd example && cargo clean
