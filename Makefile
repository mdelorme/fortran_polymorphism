FC=gfortran
FFLAGS=-g -O3 -ffree-form -std=f2008
LDFLAGS=

SRC_MODS=cooling.f90 cooling_example1.f90 cooling_example2.f90 cooling_factory.f90
MODS=cooling.mod cooling_example1.mod cooling_example2.mod cooling_factory.mod
OBJ=cooling.o cooling_example1.o cooling_example2.o cooling_factory.o
BIN=cooling_test

all: cooling

cooling: $(MODS) $(SRC)
	$(FC) $(FFLAGS) -o $(BIN) $(OBJ) main.f90 $(LDFLAGS)

%.mod: %.f90
	$(FC) $(FFLAGS) -c $<

clean:
	rm -rf *~ $(BIN) *# *.o *.mod













