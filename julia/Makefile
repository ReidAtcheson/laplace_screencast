CC=clang
CFLAGS=-shared -fPIC

#Need shared library so Julia can load it.
laplace1D_ispc.so : laplace1D_ispc.o
	$(CC) $(CFLAGS) laplace1D_ispc.o -o laplace1D_ispc.so


#Can ispc directly produce shared libraries?
laplace1D_ispc.o : 
	ispc -O3 laplace1D_ispc.ispc -o laplace1D_ispc.o


.PHONY : clean


clean : 
	rm -rf ./*.o
	rm -rf ./*.so
