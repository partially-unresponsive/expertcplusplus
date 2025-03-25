

#include <iostream>
int get_it() {
	int it{42};
	return it;
}

int main() {
	double pi{3.14};  // lvalue
	double& ref{pi};  // lvalue-reference
	
	std::cout << pi << " | " << ref << " | " << &ref << std::endl;

//	int& impossible{get_it()}; // compile error
	int&& possible{get_it()}; // rvalue reference, code will run

	std::cout << possible << " | " << &possible << std::endl;
}
