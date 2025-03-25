#include <iostream>

int double_it(int number) {
	return number * 2;
}

constexpr int triple_it(int number) {
	return number * 3;
}

int main() {
	int doubled = double_it(42);
	int tripled = triple_it(42);
	int test{0};
	std::cin >> test;
	int another_tripled = triple_it(test);
	std::cout << "Doubled: " << doubled << std::endl;
	std::cout << "Tripled (constexpr): " << tripled << std::endl;
	std::cout << "Input tripled (constexpr from stdin): " << another_tripled << std::endl;
}
