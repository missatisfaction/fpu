all: Input.class Tester.class Fpu.class
Input.class: Input.java
	javac Input.java
Tester.class: Tester.java
	javac Tester.java
Fpu.class: Fpu.java
	javac Fpu.java
test: Tester.class Fpu.class
	java Tester
input: Input.class Fpu.class
	java Input
clean:
	rm *.class
