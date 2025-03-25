#include <unordered_map>
#include <iostream>

int add (int a, int b) { return a + b; }
int subtract (int a, int b) { return a - b; }
int multiply (int a, int b) { return a * b; }
int divide(int a, int b) {return (b == 0)? 0 : a / b; }

int main() {
	std::unordered_map<char, int (*)(int, int)> operations;  // int (*)(int, int) refers to a pointer to a function that takes 2 parameters and returns 1 int as result
	operations['+'] = &add;
	operations['-'] = &subtract;
	operations['*'] = &multiply;
	operations['/'] = &divide;

	// Read the input
	char op;
	int num1, num2;
	std::cin >> num1 >> num2 >> op;
	// Perform the operation, as follows
	std::cout << operations[op](num1, num2) << std::endl;
}
