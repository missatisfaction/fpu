all: tester input
input: input.o fpu.h.gch fpu.o
	gcc -Wall -o input fpu.o fpu.h.gch input.o
tester: tester.o fpu.h.gch fpu.o
	gcc -Wall -o tester fpu.o fpu.h.gch tester.o
tester.o: tester.c
	gcc -c tester.c
input.o: input.c
	gcc -c input.c
fpu.h.gch: fpu.h
	gcc -c fpu.h
fpu.o: fpu.c
	gcc -c fpu.c
test: tester
	./tester
run: input 
	./input
clean:
	rm input tester *.o *.h.gch
