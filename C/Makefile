tester: tester.o fpu.h.gch fsqrt.o finv.o
	gcc -Wall -o tester fsqrt.o finv.o fpu.h.gch tester.o
tester.o: tester.c
	gcc -c tester.c
fpu.h.gch: fpu.h
	gcc -c fpu.h
fsqrt.o: fsqrt.c
	gcc -c fsqrt.c
finv.o: finv.c
	gcc -c finv.c
run: tester
	./tester
clean:
	rm tester *.o *.h.gch
