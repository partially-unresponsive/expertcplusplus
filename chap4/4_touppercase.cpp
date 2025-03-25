#include <iostream>

template <typename T>
struct X {
	X(T init) : meow(init) {}
	T increase() { return ++meow; }
	T meow;
};

template <>  // Note: no parameters inside <> tells the compiler it is a fully specialized template
struct X<char> {  // Note: X<char> tells the compiler it is specialized *only* for type char
	X(char init) : meow(init) {}
	char increase() { return (meow < 127) ? ++meow : (meow =-128); }
	char toUpperCase() {
		if ((meow >= 'a') && (meow <= 'z')) meow += 'A' - 'a';
		return meow;
	}
	char meow;
};

int main() {
	X<int> x1(5);
	std::cout << x1.increase() << std::endl;
	
	X<char> x2('b');
	std::cout << x2.toUpperCase() << std::endl;
	return 0;
}

