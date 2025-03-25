#include <iostream>
#include <typeinfo>
using namespace std;

// part 1: define templates
template<class T> class C {};
template<class T> void f() { cout << "T" << endl; };
template<int i> void f() { cout << i << endl; };

// part2: define structures
struct A{};   // incomplete type
typedef struct {} B;  // type alias to an unnamed type

int main() {
	cout << "Tid1=" << typeid(A).name() << "; ";
	cout << "Tid2=" << typeid(A*).name() << "; ";
	cout << "Tid3=" << typeid(B).name() << "; ";
	cout << "Tid4=" << typeid(int()).name() << "; ";

	C<A> x1;
	C<A*> x2;
	C<B> x3;
	f<int()>();
	f<5>();
	return 0;
}
