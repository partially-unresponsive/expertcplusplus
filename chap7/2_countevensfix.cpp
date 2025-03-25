#include <algorithm>
#include <iostream>
#include <vector>

int main(){
	std::vector<int> vec{2, 4, 3, 1, 7, 12};
	int even_count = std::count_if(vec.begin(), vec.end(), [](int num){ return num % 2 == 0;});
	std::cout << even_count << std::endl;
}
