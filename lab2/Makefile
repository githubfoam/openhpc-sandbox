F90 = gfortran
TARGET=ff
OBJECTS = $(TARGET).o
FCFLAGS = -g -pg -fbounds-check
OPFLAGS = -Ofast -O3 -O2 -O1
PROFILERS = gprof

#all: clean build

build:
	 # $(foreach var,$(OPFLAGS),$(F90)  $(var)  $(FCFLAGS) -o $(TARGET) $(TARGET).f90;)
	 $(foreach var,$(OPFLAGS),$(F90)  $(var)  $(FCFLAGS) -o $(TARGET) $(TARGET).f90 && ./$(TARGET) && gprof $(TARGET) gmon.out && rm -rf $(TARGET) $(OBJECTS) *.out *.o && echo "==========Build finished with"$(var)"===================" ;)



# $(TARGET): $(OBJECTS)
# 	$(F90) $(FCFLAGS) -o $(TARGET) $(OBJECTS)

#$(TARGET).o:  $(TARGET).f90
#       $(F90) $(FCFLAGS) -c $(TARGET).f90
# %.o: %.f90
# 	$(F90) $(FCFLAGS) -c $^

# run:
# 	./$(TARGET)
# 	$(foreach var,$(PROFILERS),$(var) $(TARGET) gmon.out ;)
	# gprof $(TARGET) gmon.out > ff_analysis.txt

.PHONY:clean

clean:
	rm -rf $(TARGET) $(OBJECTS) *.out *.o
