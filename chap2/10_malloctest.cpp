#include <cstdlib>
#include <iostream>

struct Point {
	float x;
	float y;
};

int main() {
	void* raw = std::malloc(sizeof(Point));
	Point* p = static_cast<Point*>(std::malloc(sizeof(Point)));
	Point* p2 = new Point;
	std::cout << "Point 1: ( " << (*p).x << ", " << (*p).y << " )" << std::endl;
	(*p).x = 0.24;
	p->y = 3.72;
	std::cout << "Point 1: ( " << (*p).x << ", " << (*p).y << " )" << std::endl;
}


