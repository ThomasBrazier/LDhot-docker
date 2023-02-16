# Make file for ldhot
# Author: Adam Auton

# Flag used to turn on multi-threading
ifndef MULTI
    MULTI = 0
endif

CPP = g++-10
CPPFLAGS = CC=gcc-10 CXX=g++-10 LD=g++-10 -Wall -Wextra -O2 -m64 -mtune=native -std=c++11 
ifeq ($(MULTI), 1)
    CPPFLAGS += -fopenmp
endif

all: ldhot ldhot_summary

ldhot: ldhot.cpp sim.cpp tools.cpp parameters.cpp output_log.cpp gpd_fit.cpp
	$(CPP) $(CPPFLAGS) ldhot.cpp parameters.cpp output_log.cpp tools.cpp sim.cpp gpd_fit.cpp -o ldhot

ldhot_summary: summary.cpp tools.cpp output_log.cpp 
	$(CPP) $(CPPFLAGS) summary.cpp tools.cpp output_log.cpp -o ldhot_summary
	
clean:
	rm -rf *.o
	rm -rf *~
	rm ldhot ldhot_summary
