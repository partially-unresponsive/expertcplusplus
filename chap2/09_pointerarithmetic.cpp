#include <iostream>

int main() {
	int ivar = 26;
	char ch = 't';
	double d = 3.14;

	char* p = (char*)&ivar;

	std::cout << "*p : " << *p << std::endl;
	std::cout << "*(p + 1): " << *(p + 1) << std::endl;
	std::cout << "*(p + 2): " << *(p + 2) << std::endl;
	std::cout << "*(p + 3): " << *(p + 3) << std::endl;
	std::cout << "*(p + 4): " << *(p + 4) << std::endl;

	std::cout << "*(p - 1): " << *(p - 1) << std::endl;
}
