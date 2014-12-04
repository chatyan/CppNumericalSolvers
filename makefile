CXX=g++
CXXFLAGS := -Wall -Wextra -pedantic-errors -std=c++11 -fopenmp -Ieigen 
CXXFLAGSTEST := -Wall -Wextra -pedantic-errors -std=c++11 -fopenmp -Ieigen -Igtest/include 


main: src/main.cpp 
	$(CXX) $(CXXFLAGS) -o main src/Meta.cpp src/ISolver.cpp src/GradientDescentSolver.cpp src/ConjugateGradientSolver.cpp src/NewtonDescentSolver.cpp src/BfgsSolver.cpp src/LbfgsSolver.cpp src/LbfgsbSolver.cpp src/main.cpp  

test: src/unittests.cpp 
	$(CXX) $(CXXFLAGSTEST) -o test src/Meta.cpp src/ISolver.cpp src/GradientDescentSolver.cpp src/ConjugateGradientSolver.cpp src/NewtonDescentSolver.cpp src/BfgsSolver.cpp src/LbfgsSolver.cpp src/LbfgsbSolver.cpp src/unittests.cpp  libgtest.a 


install:
	# google-testing-framework
	rm -f gtest-1.7.0.zip
	rm -fR gtest-1.7.0
	wget -O gtest-1.7.0.zip https://googletest.googlecode.com/files/gtest-1.7.0.zip
	unzip gtest-1.7.0.zip
	g++ -Igtest-1.7.0/include -Igtest-1.7.0 -c "gtest-1.7.0/src/gtest-all.cc" 
	ar -rv libgtest.a gtest-all.o
	rm -f gtest-1.7.0.zip
	mv gtest-1.7.0 gtest
	# eigen library
	wget -c http://bitbucket.org/eigen/eigen/get/3.2.2.tar.bz2 -O eigen-3.2.2.tar.bz2
	bunzip2 eigen-3.2.2.tar.bz2
	tar xvf eigen-3.2.2.tar
	mv eigen-eigen-* eigen 
	rm -Rf eigen-3.2.2.tar
	rm -Rf eigen-3.2.2.tar.bz2



# test: unittests.cpp 
# 	$(CXX) $(CXXFLAGSTEST) -o test Neighborhood.hpp Neighborhood.cpp Vector.hpp Vector.cpp ProQuantization.hpp ProQuantization.cpp ProTree.hpp ProTree.cpp unittests.cpp libgtest.a  -lglog
# 	GLOG_logtostderr=1 ./test

# gtest:
# 	rm -f gtest-1.7.0.zip
# 	rm -fR gtest-1.7.0
# 	wget -O gtest-1.7.0.zip https://googletest.googlecode.com/files/gtest-1.7.0.zip
# 	unzip gtest-1.7.0.zip
# 	g++ -Igtest-1.7.0/include -Igtest-1.7.0 -c "gtest-1.7.0/src/gtest-all.cc" 
# 	ar -rv libgtest.a gtest-all.o
# 	rm -f gtest-1.7.0.zip
# 	mv gtest-1.7.0 gtest


# cleanall:
# 	rm -f test
# 	rm -f main

# cleanmain:
# 	rm -f main

# cleantest:
# 	rm -f test