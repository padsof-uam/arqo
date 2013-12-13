LIBS = 
LIB_DIR =  
FLAGS = -ggdb -O0 -lgomp -Wall -D_GNU_SOURCE -fopenmp
BINDIR = bin
.PHONY: clean all

all: omp1 omp2 pescalar_serie pescalar_par1 pescalar_par2 mults clear

$(BINDIR):
	-mkdir -p $(BINDIR)

%: %.c arqo4.c | $(BINDIR)
	@echo "Building $@..."
	@gcc $(FLAGS) $(LIB_DIR) -o $(BINDIR)/$@ $^ $(LIBS)

mults: mult_great.c arqo4.c | $(BINDIR)
	@for n in 0 1 2 3 ; do \
		echo "Building mults_$$n" ; \
    	gcc $(FLAGS) -DPARAL_$$n $(LIB_DIR) -o $(BINDIR)/$@_$$n $^ $(LIBS) ; \
	done

mults_check: mult_great.c arqo4.c | $(BINDIR)
	@for n in 0 1 2 3 ; do \
		echo "Building mults_$$n" ; \
    	gcc $(FLAGS) -DPARAL_$$n -DOUTPUT_RESULT $(LIB_DIR) -o $(BINDIR)/mults_$$n $^ $(LIBS) ; \
	done

clean:
	-rm -rf *.o *~ omp1 omp2 pescalar_serie pescalar_par1 pescalar_par2 $(BINDIR)
	
clear:
	@echo "Clearing..."
	@rm -f *.o *~
