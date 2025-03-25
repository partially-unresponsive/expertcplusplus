#include <functional>
#include <iostream>

std::function<int (int, int)> get_multiplier() {
	return [](int a, int b) { return a * b; };
}
std::function<int(int)> multiply_(int a) {
	return [a](int b) { return a * b; };  // Currying the function
}

int main() {
	auto multiply = get_multiplier();
	std::cout << multiply(34, 41) << std::endl;

	std::cout << multiply_(3)(5) << std::endl;
}
