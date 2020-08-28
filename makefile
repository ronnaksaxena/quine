# makefile for dhvar assignment for 220, Fall 2020

CXXFLAGS = -std=c++11 -Wall -Werror -Wextra

# Choose the language you intend to use use, either C++ (cpp) or
# python. Uncomment exactly one of the following three lines.
#target: unspecified
target: python
#target: cppp

# Message if language not specified
unspecified:
	@echo "Language unspecified. Edit the makefile according to the"
	@echo "instructions on lines 5--6"

### C++ ruless
cpp: dhvar
	./dhvar | diff - dhvar.cc

dhvar: dhvar.cc
	g++ $(CXXFLAGS) -o dhvar dhvar.cc

### Python rules
python: dhvar.pyc
	python3 dhvar.pyc | diff - dhvar.py

dhvar.pyc: dhvar.py
	python3 -m py_compile dhvar.py
	cp __pycache__/*.pyc dhvar.pyc
	rm -rf __pycache__

clean:
	rm -rf dhvar.pyc __pycache__ *~ dhvar
