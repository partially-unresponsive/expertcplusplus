#include <cstdint>
#include <iostream>
#include <chrono>

uint32_t f1(const uint32_t n) {
	return (n <= 1) ? 1 : n * f1(n - 1);
}

constexpr uint32_t f2(const uint32_t n) {
	return (n <= 1) ? 1 : n * f2(n - 1);
}

int main() {
	auto start = std::chrono::steady_clock::now();
	uint32_t a1 = f1(25);              // run-time computation
	auto end = std::chrono::steady_clock::now();
	std::cout << "Elapsed time in ns: " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

	start = std::chrono::steady_clock::now();
	uint32_t a2 = f2(25);		// run-time computation
	end = std::chrono::steady_clock::now();
	std::cout << "Elapsed time in ns: " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

	start = std::chrono::steady_clock::now();
	const uint32_t a3 = f2(25);	// compile-time computation
	end = std::chrono::steady_clock::now();
	std::cout << "Elapsed time in ns: " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

	std::cout << "a1=" << a1 << ", a2=" << a2 << ", a3=" << a3 << std::endl;
}
