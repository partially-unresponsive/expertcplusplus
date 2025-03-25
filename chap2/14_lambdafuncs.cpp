#include <unordered_map>
#include <functional>
#include <iostream>

int main() {
	std::unordered_map<char, std::function<int(int, int)>> operations;  // Using lambda expressions
	operations['+'] = [](int a, int b) { return a + b; };
	operations['-'] = [](int a, int b) { return a - b; };
	operations['*'] = [](int a, int b) { return a * b; };
	operations['/'] = [](int a, int b) { return (b == 0)? 0 : a / b; };

	// Read the input
	char op;
	int num1, num2;
	std::cin >> num1 >> num2 >> op;
	// Perform the operation, as follows
	try {
		std::cout << operations[op](num1, num2) << std::endl;
	} catch (std::bad_function_call e) {
		std::cout << "Invalid operation";
	}
}
