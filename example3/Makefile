
FF=gfortran

default: run

linux: mod2.o mod1.o
	$(FF) -shared $^ -fPIC -o libmod.so
	rm -f *.mod *.o

mod1.o: mod1.f90
	$(FF) -c $< -fPIC

mod2.o: mod2.f90
	$(FF) -c $< -fPIC

run: clean linux ctypes_f.py
	python ctypes_f.py

clean:
	rm -f *.so *.dll
