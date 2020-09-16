F90 = gfortran
TARGET=ff
OBJECTS = $(TARGET).o
# -pg Gprof (GNU Performance Profiler)
# -ffast-math 	Possibly unsafe floating point optimizations
FCFLAGS = -g -pg -fbounds-check -ffast-math
OPFLAGS = -Ofast -O3 -O2 -O1
PROFILERS = gprof



build:
	 $(foreach var,$(OPFLAGS),$(F90)  $(var)  $(FCFLAGS) -o $(TARGET) $(TARGET).f90 && ./$(TARGET) && gprof $(TARGET) gmon.out && rm -rf $(TARGET) $(OBJECTS) *.out *.o && echo "==========Build finished with"$(var)"===================" ;)


.PHONY:clean

clean:
	rm -rf $(TARGET) $(OBJECTS) *.out *.o
