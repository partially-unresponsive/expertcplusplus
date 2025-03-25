#include <iostream>

template <typename T>  // <class T> and <typename T> are interchangeable
T app_max (T a, T b) {
	return (a > b ? a : b);
}

int main() {
	int num1 = 443;
	int num2 = 71;
	std::cout << app_max<int>(num1, num2) << std::endl;
}
