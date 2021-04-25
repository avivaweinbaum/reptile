# Reptile
Inspo from SSOL (2017), Crayon (2017), MicroC, and Michael Schwarz’s Libattopng Library
Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano
Columbia University COMS-4115 Programming Languages & Translators (Professor Stephen A. Edwards)

Introduction:
Reptile is a programming language that is intended to support libraries that streamline the process of creating simply-coded graphics. As more children are learning computer science at a younger age, there is a demand for simple programming languages that teach computer science principles in a digestible and visual manner. Languages typically labeled for beginners like Scratch and Swift Playgrounds teach kids to code by showing immediate visual results from code – whether that is a simple square or a complex environment built upon existing code blocks. Further, libraries like Turtle graphics add novelty to simple image-building operations by showing a turtle drawing the desired shape. The goal of Reptile is to build upon the success of these “beginner” programming languages to provide immediate gratification to the coders through graphics. 

Instructions to compile and run all tests:
- Start Docker using: ```docker run --rm -it -v `pwd`:/home/microc -w=/home/microc columbiasedwards/plt```
- Run: `make clean`
- Run: `make`
- You should see that all tests are successful.
