#include <iostream>
#include <string>

// Part A: define a primary template
template <class T> T app_max (T a, T b) { return (a>b?a:b); }

// Part B: explicit specialization for T=std::string
template <>
std::string app_max<std::string> (std::string a, std::string b) {
	return (a[0] > b[0]? a : b);
}

// Part C: test function
using namespace std;
int main() {
	string a = "abc", b="efg";
	cout << app_max(5, 6) << endl;  // line A
	cout << app_max(a, b) << endl;  // Line B
}	
