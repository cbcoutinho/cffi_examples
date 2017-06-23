
CC=gcc
FF=gfortran

default: run

a.out: pt_c.o pt_f.o
	$(FF) $^ -fPIC -o $@
	rm -f *.mod *.o

pt_c.o: pt_c.c
	$(CC) -c $< -fPIC

pt_f.o: pt_f.f90
	$(FF) -c $< -fPIC

run: a.out
	./a.out

clean:
	rm -f *.so *.dll
