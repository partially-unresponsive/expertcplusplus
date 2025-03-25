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
	std::cin >> num1 >> num2;
	// Perform the operation, as follows
	for (auto& [op, func]: operations) { 
		std::cout << func(num1, num2) << std::endl;
	};
}

