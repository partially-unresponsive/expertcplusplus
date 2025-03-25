#include <iostream>
#include <functional>

int main() {
	std::function<int(int, int)> muller = [](int a, int b) {return a * b;};
	std::function<float(int, int)> divider = [](int a, int b) {return (b == 0)? 0 : (a / b);};
	std::cout << muller(53, 22) << std::endl;
	std::cout << divider(53, 22) << std::endl;
}
