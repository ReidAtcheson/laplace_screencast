
CC := clang

CFLAGS := -Wall --shared -fPIC -msse -O3 -ftree-vectorize -fslp-vectorize-aggressive -ffast-math

laplace1D : laplace1D.c
	$(CC) $(CFLAGS) laplace1D.c -o laplace1D.so



.PHONY : clean


clean : 
	rm -rf laplace1D.so
