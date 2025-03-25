#include <iterator>
#include <type_traits>
#include <iostream>
#include <vector>
template <typename Iter>
typename std::iterator_traits<Iter>::difference_type distancer(Iter first,
Iter last)
{
using category = std::iterator_traits<Iter>::iterator_category;
if constexpr (std::is_same_v<category, std::random_access_iterator_tag>)
{
return last - first;
}
typename std::iterator_traits<Iter>::difference_type count;
for (; first != last; ++count, first++) {}
return count;
}

int main(){
	std::vector<double> vec{3.4, 1.74, 0.55, 39.41, 16.042};
	std::vector<double>::iterator vit = vec.begin();
	std::vector<double>::iterator vend = vec.end();
	std::cout << "Distance: " << distancer(vit, vend) << std::endl;
}
