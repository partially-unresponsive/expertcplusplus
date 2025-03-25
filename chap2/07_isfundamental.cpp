#include <iostream>
#include <type_traits>
#include <sstream>

struct Point {
	float x;
	float y;
};

int main() {
	std::cout  << std::boolalpha // boolalpha is an I/O manipulator that displays 0 -> false and 1 -> true for any type of std::basic_ostream (i.e., std::cout)
		   << std::is_fundamental_v<Point> << " "
		   << std::is_fundamental_v<int> << " "
		   << std::is_compound_v<Point> << " "
		   << std::is_compound_v<int> << std::endl;
}
