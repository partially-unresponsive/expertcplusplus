#include <algorithm>
#include <ios>
#include <iostream>
#include <string>
#include <vector>

struct Product {
	int price;
	bool available;
	std::string title;
};

class ProductComparator {
public:
	bool operator()(const Product& a, const Product& b) { return a.price > b.price; }
};

void displayProducts(std::vector<Product> pr) {
	std::cout << "===PRODUCTS===" << std::endl;
	for (const auto& it : pr) {
		std::cout << std::boolalpha 
			  << it.title << "($" << it.price << ") | Available: " << it.available << std::endl;  
	}
}

int main() {
	std::vector<Product> products;
	products.push_back({5, false, "Bunny Wand"});
	products.push_back({12, true, "Cosmogenic Guava Juice"});

	displayProducts(products);
	// Using a comparator function for our custom type
	std::sort(products.begin(), products.end(), ProductComparator{});

	displayProducts(products);
	products.push_back({8, false, "5x3m Post-it Notes"});
	products.push_back({27, true, "Brother Ink Jet Printer"});
	// Lambda functions
	std::sort(products.begin(), products.end(), [](const Product& a, const Product& b) { return a.price > b.price; });
	displayProducts(products);
}
