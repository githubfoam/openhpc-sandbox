F90 = gfortran
TARGET=ff
OBJECTS = $(TARGET).o
# -pg Gprof (GNU Performance Profiler)
# -ffast-math 	Possibly unsafe floating point optimizations
FCFLAGS = -g -pg -fbounds-check -ffast-math
OPFLAGS = -Ofast -O3 -O2 -O1
#PROFILERS = gprof strace ltrace valgrind

all: build-gprof build-strace build-ltrace build-valgrind
.PHONY: all

build-gprof:
	 $(foreach var,$(OPFLAGS),$(F90)  $(var)  $(FCFLAGS) -o $(TARGET) $(TARGET).f90 && ./$(TARGET) && gprof $(TARGET) gmon.out && rm -rf $(TARGET) $(OBJECTS) *.out *.o && echo "==========Build finished with"$(var)"===================" ;)

build-strace:
	 $(foreach var,$(OPFLAGS),$(F90)  $(var)  $(FCFLAGS) -o $(TARGET) $(TARGET).f90 && ./$(TARGET) && strace -c ./$(TARGET)  && rm -rf $(TARGET) $(OBJECTS) *.out *.o && echo "==========Build finished with"$(var)"===================" ;)

build-ltrace:
	 $(foreach var,$(OPFLAGS),$(F90)  $(var)  $(FCFLAGS) -o $(TARGET) $(TARGET).f90 && ./$(TARGET) && ltrace -c ./$(TARGET)  && rm -rf $(TARGET) $(OBJECTS) *.out *.o && echo "==========Build finished with"$(var)"===================" ;)

build-valgrind:
 	 $(foreach var,$(OPFLAGS),$(F90)  $(var)  $(FCFLAGS) -o $(TARGET) $(TARGET).f90 && ./$(TARGET) && valgrind --tool=callgrind ./$(TARGET)  && rm -rf $(TARGET) $(OBJECTS) *.out *.o && echo "==========Build finished with"$(var)"===================" ;)

clean:
	rm -rf $(TARGET) $(OBJECTS) *.out *.o
