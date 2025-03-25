#include <iostream>

// C++11
auto foo() -> int {
	std::cout << "foo in alternative function syntax" << std::endl;
	return 0;
}

// C++14
auto foo2() {
	std::cout << "In C++14 syntax" << std::endl;
	return 0;
}

int main() {
	std::cout << "Inside main()" << std::endl;
	foo();
	foo2();
	// "return 0;" is automatically assumed ONLY for the main() function
}

