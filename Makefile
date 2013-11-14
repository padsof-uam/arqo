LIBS = 
LIB_DIR =  
FLAGS = -g -Wall -D_GNU_SOURCE

.PHONY: clean all

all: fast slow ej1

fast: fast.c arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o $@ $^ $(LIBS)

slow: slow.c arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o $@ $^ $(LIBS)

ej1: ej1.c arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o $@ $^ $(LIBS)

clean:
	rm -f *.o *~ fast slow 
