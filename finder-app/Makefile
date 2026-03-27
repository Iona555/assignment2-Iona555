# Using the cross compile variable
CC = $(CROSS_COMPILE)gcc

# Default target
default: writer

writer: writer.o
	$(CC) -o writer writer.o
	
writer.o: writer.c
	$(CC) -c writer.c -o writer.o

# Clean target
clean:
	rm -f writer writer.o
