#include <ios>
#include <iostream>
#include <string>


struct Product {
	std::string name;
	double price;
	int rating;
	bool available;
};

void set_rating(Product* p, int r) {
	if (r >= 1 && r <= 5) {
		p->rating = r;
	}
};


int main() {
	Product plushie;
	plushie.name = "Reinfield";
	set_rating(&plushie, 4);
	plushie.available = true;

	std::cout << std::boolalpha << "PLUSHIE AVAILABLE: " << plushie.available << std::endl;
	std::cout << "RATING: " << plushie.rating << std::endl;
	std::cout << "NAME: " << plushie.name << std::endl;

};
