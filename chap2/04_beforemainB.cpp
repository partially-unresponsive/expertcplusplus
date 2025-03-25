#include <iostream>

struct BeforeMain {
	BeforeMain() {
		std::cout << "Constructing BeforeMain" << std::endl;
	}
	void test() {
		std::cout << "test function" << std::endl;
	}
};

BeforeMain b;
b.test(); // compiler error

int main() {
	std::cout << "Calling main()" << std::endl;;
	return 0;
}
