appname := helloworld
CXX := g++
CXXFLAGS := -Wall -g -I/usr/local/include/scew/
srcfiles := $(shell find . -maxdepth 1 -name "*.cpp")
objects  := $(patsubst %.cpp, %.o, $(srcfiles))
LDFLAGS := -L/usr/local/lib/
LDLIBS := -lscew 
all: $(appname)

$(appname): $(objects)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(appname) $(objects) $(LDLIBS)
 
depend: .depend
 
.depend: $(srcfiles)
	rm -f ./.depend
	$(CXX) $(CXXFLAGS) -MM $^>>./.depend;
 
clean:
	rm -f $(objects)
 
dist-clean: clean
	rm -f *~ .depend
 
include .depend
