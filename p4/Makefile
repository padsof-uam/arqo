LIBS = 
LIB_DIR =  
FLAGS = -ggdb -O0 -lgomp -Wall -D_GNU_SOURCE -fopenmp
BINDIR = bin
.PHONY: clean all

all: omp1 omp2 pescalar_serie pescalar_par1 pescalar_par2 mults clear

$(BINDIR):
	-mkdir -p $(BINDIR)

omp1: omp1.c | $(BINDIR)
	gcc $(FLAGS) $(LIB_DIR) -o $(BINDIR)/$@ $^ $(LIBS)

omp2: omp2.c | $(BINDIR)
	gcc $(FLAGS) $(LIB_DIR) -o $(BINDIR)/$@ $^ $(LIBS)

pescalar_serie: pescalar_serie.c arqo4.c | $(BINDIR)
	gcc $(FLAGS) $(LIB_DIR) -o $(BINDIR)/$@ $^ $(LIBS)

pescalar_par1: pescalar_par1.c arqo4.c | $(BINDIR)
	gcc $(FLAGS) $(LIB_DIR) -o $(BINDIR)/$@ $^ $(LIBS)

pescalar_par2: pescalar_par2.c arqo4.c | $(BINDIR)
	gcc $(FLAGS) $(LIB_DIR) -o $(BINDIR)/$@ $^ $(LIBS)

mults: mult_great.c arqo4.c | $(BINDIR)
	for n in 0 1 2 3 ; do \
    	gcc $(FLAGS) -DPARAL_$$n $(LIB_DIR) -o $(BINDIR)/$@_$$n $^ $(LIBS) ; \
	done

mults_check: mult_great.c arqo4.c | $(BINDIR)
	for n in 0 1 2 3 ; do \
    	gcc $(FLAGS) -DPARAL_$$n -DOUTPUT_RESULT $(LIB_DIR) -o $(BINDIR)/mults_$$n $^ $(LIBS) ; \
	done

clean:
	-rm -rf *.o *~ omp1 omp2 pescalar_serie pescalar_par1 pescalar_par2 $(BINDIR)
	
clear:
	rm -f *.o *~
