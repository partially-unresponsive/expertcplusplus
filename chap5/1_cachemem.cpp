#include <chrono>
#include <iostream>
#include <unordered_map>

std::unordered_map<long, long> cache;

long factorial(long n) {
	if (n <= 1) return 1;
	if (cache.contains(n)) return cache[n];
	cache[n] = n * factorial(n - 1);
	return cache[n];
}

int main() {
	auto start = std::chrono::steady_clock::now();
	std::cout << factorial(34) << std::endl;
	auto end = std::chrono::steady_clock::now();
	std::cout << "First iteration time (ns): " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

	start = std::chrono::steady_clock::now();
	std::cout << factorial(36) << std::endl;
	end = std::chrono::steady_clock::now();
	std::cout << "Second iteration time (ns): " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;
}
