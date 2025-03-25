#include <iostream>
#include <vector>
#include <deque>
#include <list>
using namespace std;

template<class T, template<class, class...> class X, class... Args>
std::ostream& operator <<(std::ostream& os, const X<T, Args...>& objs) {
	os << __PRETTY_FUNCTION__ << ":" << endl;  // __PRETTY_FUNTION__ will print out the function name (including the specific template used) for better logging. It's like doing std::cout << "Inside foo()", but it's already all done for you
	// After you know that, the rest of the function is just "for any template class you choose, just print out all its objects". The Vector, Deque, List implementation does not need to be understood.
	for (auto const& obj : objs) {
		os << obj << ' ';
	}
	return os;
}

int main() {
	vector<float> x{ 3.14f, 4.2f, 7.9f, 8.08f };
	cout << x << endl;

	list<char> y{ 'E', 'F', 'G', 'H', 'I' };
	cout << y << endl;

	deque<int> z{ 10, 11, 303, 404 };
	cout << z << endl;
	return 0;
}
