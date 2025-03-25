#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

int main() {
	std::vector<double> vec{1.1, 2.2, 4.3, 5.6, 2.4};
	std::vector<double> result;
	std::transform(vec.begin(), vec.end(), result, [](double num){ return std::sqrt(num);});
	for (const auto& elem : result) { std::cout << elem << std::endl;};

}
