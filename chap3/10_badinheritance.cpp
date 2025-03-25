#include <iostream>

class Rectangle {
public:
	void set_width(int w) { width_ = w; }
	void set_height(int h) { height_ = h; }
	int area() const { return width_ * height_; }
private:
	int width_;
	int height_;
};

void make_big_rectangle(Rectangle* ref) {
	ref->set_width(870);
	ref->set_height(940);
}

class Square : private Rectangle {
public:
void set_side(int side) {
	// Rectangle's public interface is accessible to the Square
	set_width(side);
	set_height(side);
}
int area() {
	area_ = Rectangle::area();
	return area_;
}
private:
	int area_;
};

int main()
{
	Square sq;
	sq.set_side(45);
	// sq.set_width(14);  // compile error, the Square has no such public member
	// make_big_rectangle(sq);  // compile error, can't cast Square to Rectangle
	std::cout << sq.area() << std::endl;
}
