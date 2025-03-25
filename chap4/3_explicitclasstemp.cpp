#include <iostream>
using namespace std;
template <typename T>    // line A
struct A {
	A(T init) : val(init) {}
	virtual T foo();
	T val;
};

template <class T>  // T in this line is template parameter
T A<T>::foo() {  // The 1st T refers to function return type,
	// the T in <> specifies that this function's template parameter is also the class template parameter
	return val;
}

extern template struct A<int>;
#if 1
int A<int>::foo() {
	return val+1;
}
#endif

int main() {
	A<double> x(5);
	A<int> y(5);
	cout << "fD = " << x.foo() << ", fI = " << y.foo() << endl;
	return 0;  // Output: fD = 5, fI = 6
}
