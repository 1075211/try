CC = gcc
CXX = g++
CC_FLAGS = -Wall -I.
LD_FLAGS = -Wall -L.

all: libcalc test client server

servermain.o: servermain.cpp
	$(CXX) $(CC_FLAGS) $(CFLAGS) -c servermain.cpp

clientmain.o: clientmain.cpp
	$(CXX) $(CC_FLAGS) $(CFLAGS) -c clientmain.cpp

main.o: main.cpp
	$(CXX) $(CC_FLAGS) $(CFLAGS) -c main.cpp

test: main.o calcLib.o
	$(CXX) $(LD_FLAGS) -o test main.o -L. -lcalc

client: clientmain.o calcLib.o
	$(CXX) $(LD_FLAGS) -o client clientmain.o -L. -lcalc

server: servermain.o calcLib.o
	$(CXX) $(LD_FLAGS) -o server servermain.o -L. -lcalc

calcLib.o: calcLib.c calcLib.h
	$(CC) -Wall -fPIC -c calcLib.c

libcalc: calcLib.o
	ar -rcs libcalc.a calcLib.o

clean:
	rm -f *.o *.a test server client

