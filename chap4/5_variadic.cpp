#include <cmath>
#include <iostream>
#include <math.h>

double my_min(double n) {
	return n;
}

template<typename... Args>
double my_min(double n, Args... args){
	return std::fmin(n, my_min(args...));
}

int main() {
	double x1 = my_min(2);
	double x2 = my_min(2, 3);
	double x3 = my_min(2, 3, 4, 5, 4.7, 5.6, 9.9, 0.1);
	std::cout << "x1= " << x1 << ", x2= " << x2 << ", x3= " << x3 << std::endl;
	return 0;
}
