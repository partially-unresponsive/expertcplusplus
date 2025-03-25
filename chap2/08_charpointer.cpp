#include <iostream>

int main() {
	int ivar = 26;
	char ch = 't';
	double d = 3.14;

	int* ptr = &ivar;
	char* pch = &ch;
	double* pd = &d;

	std::cout << "Address: " << ptr << "| Value: " << *ptr << std::endl;
	std::cout << "Address: " << pch << "| Value: " << *pch << std::endl;
	std::cout << "Address: " << pd << "| Value: " << *pd << std::endl;
}
