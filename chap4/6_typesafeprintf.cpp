#include <cstdio>
#include <iostream>
#include <stdexcept>

void printf_vt(const char *s){
	while (*s) {
		if (*s == '%' && *(++s) != '%') 
			throw std::runtime_error("Invalid format string: missing arguments");
		std::cout << *s++;
	}
}
		
template<typename T, typename... Rest>
void printf_vt(const char *s, T value, Rest... rest){
	while (*s){
		if (*s == '%' && *(++s) != '%'){
			std::cout << value;
			printf_vt(s, rest...);
			return;
		}
	std::cout << *s++;
	}
}

int main() {
	int x = 10;
	float y = 3.6;
	std::string s = std::string("Variadic templates");
	const char* msg1 = "%s can accept %i paramters (or %s), x=%d, y=%f\n";
	printf(msg1, s.c_str(), 100, "more", x, y);  // Replace 's' by 's.c_str()' to prevent the output bug
	
	const char* msg2 = "% can accept % parameters (or %); x=%,y=%\n";
	printf_vt(msg2, s, 100, "more", x, y);
	return 0;
}
	
