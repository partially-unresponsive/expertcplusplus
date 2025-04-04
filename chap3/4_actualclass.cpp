#include <iostream>
#include <ostream>

class Product {
	public:
		Product() = default; // default constructor
		Product(const Product&); // copy constructor
		Product(Product&&); // move constructor

		Product& operator=(const Product&) = default;
		Product& operator=(Product&&) = default;
		// deconstuctor is not declared, should be generated by compiler
	public:
		// A combination of setters and getters (without any actual input modification)
		void set_name(const std::string& name) { this->name_ = name; };
		std::string name() const { return this->name_; };

		void set_availability(bool b) { this->available_ = b; };
		bool available() const { return this->available_; };

		void set_price(double price) { this->price_ = price; };
		double price() { return this->price_; };

		void set_rating(int rate) { this->rating_ = rate; };
		int rating() { return this->rating_; };
		
	private:
		// The private variables that the setters modify and the getters obtain
		std::string name_;
		double price_;
		int rating_;
		bool available_;
};

// ostream and istream operator overloading not yet implemented
std::ostream& operator<<(std::ostream&, const Product&);
std::istream& operator>>(std::istream&, Product&);

Product create_apple() {
	Product apple;
	apple.set_name("Red apple");
	apple.set_price(0.2);
	apple.set_rating(5);
	apple.set_availability(true);
	return apple;
}

int main() {
	Product red_apple = create_apple();
	Product book;
	Product* ptr = &book;
	ptr->set_name("Alice in Wunderbar");
	ptr->set_price(6.80);
	std::cout << "I'm reading " << book.name()
		  << " and I bought an apple for $" << red_apple.price()
		  << std::endl;
}
