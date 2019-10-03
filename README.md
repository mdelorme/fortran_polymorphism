# Polymorphism in modern Fortran for mini-ramses

The contents of this repo were developed as part of the Ramses User Meeting 2019 Hackaton.
Here we look at polymorphism as a way to implement various physics module in Ramses while avoiding filling-up the main code with disjunctive cases. The contents of this repo is not at all physical, it is just meant as an example of how to implement this type of strategies, but is clearly not a real cooling function example.

## Source code :
The code is composed of 5 source files that should be visited in the following order :

1. ```cooling.f90``` declares the main type that will be "seen" by RAMSES : ```CoolingFunction```. This type implements two procedures : ```init_cooling``` and ```compute_cooling```. These will be the ones called by the main code.
1. ```cooling_example_1.f90``` declares one specialization of ```CoolingFunction``` : ```MyCooling1```. This class *extends* ```CoolingFunction``` which means it benefits from all its attributes (variables) but also overrides the two functions mentionned previously. That way the behaviour of this specific ```CoolingFunction``` is entirely defined in that file. 
1. ```cooling_example_2.f90``` declares another cooling function
1. ```cooling_factory.f90``` holds the _factory_ : a process that will take as input a way to identify which cooling function you want, and will allocate the right one. In the end a ```CoolingFunction``` is return, but thanks to _polymorpshim_ this ```CoolingFunction``` can be the default one, or any of the extensions defined in your custom files (```cooling_example_1.f90``` and ```cooling_example_2.f90```).
1. ```main.f90``` is the main program. It asks the user to input a "name" for the cooling module (accepted names are ```Cooling1``` and ```Cooling2```, then send the info to the factory that will instantiate the right ```CoolingFunction```. The code then proceeds in initialising the cooling function and calling it.

## Compiling and Running :

```
$ make
gfortran -g -O3 -ffree-form -std=f2008 -c cooling.f90
gfortran -g -O3 -ffree-form -std=f2008 -c cooling_example1.f90
gfortran -g -O3 -ffree-form -std=f2008 -c cooling_example2.f90
gfortran -g -O3 -ffree-form -std=f2008 -c cooling_factory.f90
gfortran -g -O3 -ffree-form -std=f2008 -o cooling_test cooling.o cooling_example1.o cooling_example2.o cooling_factory.o main.f90 

$ ./cooling_test
 Which cooling function do you want : 
Cooling1
 Instancing Cooling function Cooling1
 Intantiation of MyCooling1
 Calling MyCooling1%compute_cooling
 Output of cooling :           15
 
$ ./cooling_test
 Which cooling function do you want : 
Cooling2
 Instancing Cooling function Cooling2
 Intantiation of MyCooling2
 Calling MyCooling2%compute_cooling
 Output of cooling :          360
 
$ ./cooling_test
 Which cooling function do you want : 
ClearlyNotExistingCoolingFunction
 Instancing Cooling function ClearlyNotExistingCoolingFunction
 ERROR : Unknown Cooling function !
```