#include <iostream>

template<int N>
class V {
public:
	V(int init) {
		for (int i = 0; i < N; ++i) { a[i] = init; }
	}
	int a[N];
};

template<const char* msg>
void foo() {
	std::cout << msg << std::endl;
}

// need to have external linkage
extern const char str1[] = "Test 1";
constexpr char str2[] = "Test 2";
// extern const char* str3 = "Test 3";

int main() {
	V<5> x(72);  // x.a is an array of 5 integers, initialized as all 72
	x.a[4] = 10;
	for (auto &e : x.a) {
		std::cout << e << std::endl;
	}

	foo<str1>();
	foo<str2>();
	// foo<str3>();
	const char str4[] = "Test 4";
	constexpr char str5[] = "Test 5";
	// foo<str4>();
	// foo<str5>();
}
