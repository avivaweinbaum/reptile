# "make test" Compiles everything and runs the regression tests

.PHONY : test
test : all testall.sh
	./testall.sh

# "make all" builds the executable as well as the "printbig" library designed
# to test linking external code

.PHONY : all
all : reptile.native rgb canvas pointer png pixelator trig# printbig.o

# "make reptile.native" compiles the compiler
#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc

reptile.native :
	opam config exec -- \
	ocamlbuild -use-ocamlfind reptile.native

# "make clean" removes all generated files

.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff *.o

# Testing the "printbig" example

# printbig : printbig.c
#	cc -o printbig -DBUILD_TEST printbig.c

rgb : rgb.c
	gcc -c rgb.c -lm

canvas: canvas.c
	gcc -c canvas.c -lm

pointer: pointer.c
	gcc -c pointer.c -lm

png: png.c
	gcc -c png.c -lm

pixelator: pixelator.c
	gcc -c pixelator.c -lm

trig: trig.c
	gcc -c trig.c -lm

# Building the tarball

TESTS = \
	helloworld float void assign arithmetic if if2 if3 if4 if5 if6 \
	else string comments create_save fib field pixel pointer rgb \
	while and or not

FAILS = \
	helloworld float if dead dead2 func func2 func3 func4 func5 func6 \
	func7 expr global if2 nomain return
 # assign1 assign2 assign3 dead1 dead2 expr1 expr2 expr3 float1 float2 \
 # for1 for2 for3 for4 for5 func1 func2 func3 func4 func5 func6 func7 \
 # func8 func9 global1 global2 if1 if2 if3 nomain printbig printb print \
 # return1 return2 while1 while2

TESTFILES = $(TESTS:%=test-%.rt) $(TESTS:%=test-%.out) \
	    $(FAILS:%=fail-%.rt) $(FAILS:%=fail-%.err)

TARFILES = ast.ml sast.ml codegen.ml Makefile _tags reptile.ml parser.mly \
	README scanner.mll semant.ml testall.sh \
	printbig.c \
	Dockerfile \
	$(TESTFILES:%=tests/%)

reptile.tar.gz : $(TARFILES)
	cd .. && tar czf reptile/reptile.tar.gz \
		$(TARFILES:%=reptile/%)
