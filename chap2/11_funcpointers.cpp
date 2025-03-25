#include <iostream>

int get_answer() { return 42; };

int main(){
	int (*fp)() = &get_answer;
	std::cout << get_answer() << std::endl;
	std::cout << fp() << std::endl;
}
