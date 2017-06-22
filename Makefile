
FF=gfortran

default: clean

all_nix: libexample_f.so libexample_r.so

all_win: example_f.dll example_r.dll

example_m.o: example_m.f90
	$(FF) -c $< -fPIC -o $@

libexample_f.so: example_m.o
	$(FF) -shared $< -fPIC -o $@
	rm -f example.mod example_m.o

example_f.dll: example_m.o
	$(FF) -shared $< -fPIC -o $@
	rm -f example.mod example_m.o


libexample_r.so: example/src/lib.rs
	cd example && cargo build
	mv example/target/debug/$@ .

example_r.dll: example/src/lib.rs
	cd example && cargo build
	mv example/target/debug/$@ .

python_f: libexample_f.so cffi_f.py
	LD_LIBRARY_PATH=. python3 cffi_f.py

python_r: libexample_r.so cffi_r.py
	LD_LIBRARY_PATH=example/target/debug python3 cffi_r.py

clean:
	rm -f example.mod *.so *.dll
	cd example && cargo clean
