#include <cmath>
#include <iostream>
class QuadraticSolver {
public:
	QuadraticSolver() = delete;  // Default constructor function is deleted, disallowing the user from creating any instance of the QuadraticSolver class
	static double solve_by_discriminant(double a, double b, double c) { // Declaring the function as `static` allows the user to utilize the method without having to define an instance of the QuadraticSolver class
		double discr = b*b - 4*a*c;
		return ((-b + std::sqrt(discr))/(2*a));
	}
};

int main() {
	std::cout << QuadraticSolver::solve_by_discriminant(2, 5, -8) << std::endl; 
}
