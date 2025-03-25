#include <cstdint>
#include <iostream>
#include <chrono>

// define a primary template with non-type parameters
template <uint32_t n>
struct fact {
	const static uint32_t value = n * fact<n - 1>::value;
};

// fully specialized template for n as 0
template <>
struct fact<0> {
	const static uint32_t value = 1;
};

using namespace std;

int main() {
	auto start = std::chrono::steady_clock::now();
	uint32_t a1 = fact<0>::value;              // run-time computation
	auto end = std::chrono::steady_clock::now();
	std::cout << "Elapsed time in ns: " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

	start = std::chrono::steady_clock::now();
	uint32_t a2 = fact<10>::value;		// run-time computation
	end = std::chrono::steady_clock::now();
	std::cout << "Elapsed time in ns: " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

	start = std::chrono::steady_clock::now();
	const uint64_t a3 = fact<30>::value;	// compile-time computation
	end = std::chrono::steady_clock::now();
	std::cout << "Elapsed time in ns: " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

	std::cout << "a1=" << a1 << ", a2=" << a2 << ", a3=" << a3 << std::endl;
}
