#include <algorithm>
#include <cctype>
#include <execution>
#include <functional>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>
int main(){
	
	std::vector<int> elems{1, 2, 3, 4, 5, 6};
	auto divis = std::find_if(elems.begin(), elems.end(), [](int el){ return el % 3 == 0;});

	std::string str = "lowercase";
	std::transform(str.begin(), str.end(), str.begin(), [](unsigned char c){ return std::toupper(c);});
	std::cout << str << std::endl;
	
	std::vector<double> delems{1.1, 2.2, 3.3, 4.4, 5.5};
	auto sum = std::accumulate(delems.begin(), delems.end(), 0);  // 3rd argument is the 'accumulator' or initial value

	std::reduce(std::execution::par, delems.begin(), delems.end(), 1, std::multiplies<int>());
	for (const auto& it : delems) { std::cout << it << std::endl; };
}

