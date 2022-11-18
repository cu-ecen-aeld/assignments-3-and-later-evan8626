cc=$(CROSS_COMPILE)gcc
Cflags = -g -Wall
source := writer.c
file = writer
Object := $(source:.c=.o)

all: $(file)

$(file): $(Object)
	$(cc) $(Cflags) $(INCLUDES) -o $(file) $(file).c
	
clean all: 
	rm -f $(file)*.o 

*.o: *.c

#writer: writer.o
