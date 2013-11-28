LIBS = 
LIB_DIR =  
FLAGS = -g -Wall -D_GNU_SOURCE

.PHONY: clean all

all: fast slow mult_norm mult_great

fast: src/fast.c src/arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o bin/$@ $^ $(LIBS)

slow: src/slow.c src/arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o bin/$@ $^ $(LIBS)

mult_norm: src/mult_norm.c src/arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o bin/$@ $^ $(LIBS)

mult_great: src/mult_great.c src/arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o bin/$@ $^ $(LIBS)


ej1: src/ej1.c src/arqo3.c
	gcc $(FLAGS) $(LIB_DIR) -o bin/$@ $^ $(LIBS)

clean:
	rm -f *.o *~ fast slow mult_norm mult_great bin/*