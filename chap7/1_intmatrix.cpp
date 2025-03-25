#include <algorithm>
#include <vector>
#include <ranges>
using IntMatrix = std::vector<std::vector<int>>;

/* // INITIAL MONOLITHIC FUNCTION
std::vector<int> count_all_evens(const IntMatrix& numbers) {
	std::vector<int> even_numbers_count;
	for (const auto& number_line : numbers) {
		int even{0};
		for (const auto& number : number_line) {
			if (number % 2 == 0) { ++even; }
		}
	even_numbers_count.push_back(even);
	}
	return even_numbers_count;
} */

int count_evens(const std::vector<int>& number_line) {
	return std::count_if(number_line.begin(), number_line.end(), [](int num){return num % 2 == 0;}); 
	// Utilizing a Lambda function
}

std::vector<int> count_all_evens(const std::vector<std::vector<int>>& numbers) {
	return numbers | std::ranges::views::transform_view(count_evens);
}
