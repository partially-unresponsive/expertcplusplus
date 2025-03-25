#include <unordered_map>
#include <functional>
#include <iostream>

int add (int a, int b) { return a + b; }
int subtract (int a, int b) { return a - b; }
int multiply (int a, int b) { return a * b; }
int divide(int a, int b) {return (b == 0)? 0 : a / b; }

int main() {
	std::unordered_map<char, std::function<int(int, int)>> operations;  // Using the functional approach
	operations['+'] = &add;
	operations['-'] = &subtract;
	operations['*'] = &multiply;
	operations['/'] = &divide;

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
