#include <iostream>
#include <thread>
void print_numbers_in_background()
{
	auto ix{0};
	// Attention: an infinite loop!
	while (ix < 200) {
		std::cout << "Background: " << ix++ << std::endl;
	}
}

int main()
{
	std::jthread background{print_numbers_in_background};
	auto jx{0};
	while (jx < 50) {
		std::cout << "Main: " << jx++ << std::endl;
	}
	// The main thread is about to finish, so we request the background thread to stop
	background.request_stop();
}
