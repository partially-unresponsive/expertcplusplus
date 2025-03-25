#include <iostream>
#include <thread>
void print_numbers_in_background()
{
	auto ix{0};
	// Attention: an infinite loop!
	while (ix < 100) {
		std::cout << "Background: " << ix++ << std::endl;
	}
	std::cout << "Background thread finished" << std::endl;
}

int main()
{
	std::thread background{print_numbers_in_background};
	auto jx{0};
	while (jx < 50) {
		std::cout << "Main: " << jx++ << std::endl;
	}
	std::cout << "Main() finished" << std::endl;
	background.join();
	std::cout << "background.join()" << std::endl;
}
