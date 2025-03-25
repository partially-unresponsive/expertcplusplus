#include <iostream>
int main(int argc, char* argv[]){
	std::cout << "The number of arguments passed is " << argc << std::endl;
	std::cout << "Arguments are: " << std::endl;
	for (int ix = 1; ix < argc; ix++){ // Starting loop from ix=1, since argv[0] is the name of the program
		std::cout << argv[ix] << std::endl; 
	}
	return 0;
}
