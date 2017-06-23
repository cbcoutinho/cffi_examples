
FF=gfortran

default: run

linux: mod2.o mod1.o
	$(FF) -shared $^ -fPIC -o libmod.so
	rm -f *.mod *.o

mod1.o: mod1.f90 mod2.o
	$(FF) -c $< -fPIC

mod2.o: mod2.f90
	$(FF) -c $< -fPIC

run: clean linux cffi_f.py
	python cffi_f.py

clean:
	rm -f example.mod *.so *.dll *.o
