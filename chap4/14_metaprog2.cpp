#include <iostream>

// Primary template declaration
template <const int N, typename X>
class powerp {
public:
	static X result(X* a) {
		return (*a) * powerp<N - 1, X>::result(a);
	}
};

// Partial specialization for end condition
template <typename X>
class powerp<2, X> {
public:
	static X result(X* a) {
		return (*a) * (*a);
	}
};

int main() {
	int src;
	std::cin >> src;
	const int num = 4;
	std::cout << "src^4 = " << powerp<num, int>::result(&src) << '\n';
}
