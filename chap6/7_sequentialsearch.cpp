#include <vector>
template <typename T>
int searchr(const std::vector<T>& vec, const T& item){  // Sequantial search, O(n) linear complexity
	for (int ix = 0; ix < vec.size(); ++ix) {
		if (vec[ix] == item) { return ix; }
	}
	return -1; // not found
}
