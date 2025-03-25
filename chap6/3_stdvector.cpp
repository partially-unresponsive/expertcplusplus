#include <list>
#include <stdexcept>
#include <vector>
#include <iostream>

struct Point
{
	float x;
	float y;
	float z;

	Point(float px, float py, float pz) : x(px), y(py), z(pz) {}  // constructor
	Point(Point&& p) : x(p.x), y(p.y), z(p.z) {}  // move constructor
};

int main()
{
	// Section 1: std::vector<int>
	std::cout << "===VECTORS===" << std::endl;
	std::vector<int> vec;
	vec.reserve(32);  // sets the capacity of how many ints it can handle by reserving enough memory for 32 items
	vec.push_back(4);
	vec.push_back(2);
	vec.push_back(13);
	std::cout << "Regular const auto& elem loop" << std::endl;
	for (const auto& elem : vec)
	{
		std::cout << elem << std::endl;
	}
	std::cout << "The safe approach of accessing elements" << std::endl;
	std::cout << vec.at(2) << std::endl;  // .at() method has bounds checking
	try {
	  std::cout << vec.at(5) << std::endl;
	} catch (std::out_of_range& e) {
	  std::cout << "Vector element out of range :P" << std::endl;
	}
	std::cout << vec.data()[2] << std::endl;


	// Section 1b: std::vector<Point>
	std::cout << "std::vector<Point>" << std::endl;

	std::vector<Point> points;
	points.push_back(Point(1.1, 2.2, 3.3));
	points.push_back(Point(4.4, 5.5, 6.6));
	points.emplace_back(4.4, 5.5, 6.6);  // what does this do

	for (const auto& elem : points)
	{
		std::cout << "Point: (" << elem.x << ", " << elem.y << ", " << elem.z << ")" << std::endl;
	}

	// Section 2: std::list<double>
	std::cout << "===LINKED LIST===" << std::endl;
	std::list<double> lst;
	lst.push_back(4.2);
	lst.push_back(17.53);
	lst.push_front(3.14); // 3.14 -> 4.2 -> 17.53
	
	std::list<double> lst2;
	lst2.push_back(25.33);
	lst2.push_back(67.24);
	lst2.push_front(20.024);
	lst.merge(lst2);

	for (const auto& elem : lst)
	{
		std::cout << elem << std::endl;
	}

}
