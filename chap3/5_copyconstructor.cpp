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

class Warehouse {
	public:
		Warehouse() : size_{0}, capacity_{1000}, products_{nullptr}
		{
			products_ = new Product[capacity_];
		}
		
		~Warehouse() {
			delete [] products_;
		}
		Warehouse(const Warehouse& rhs) {  // *Deep* copy constructor in instances like
		// Warehouse w2 = w1;
			size_ = rhs.size_;
			capacity_ = rhs.capacity_;
			products_ = new Product[capacity_];
			for (int ix = 0; ix < size_; ++ix) {
				products_[ix] = rhs.products_[ix];
			}
		}

	public:
		void add_product(const Product& p) {
			if (size_ == capacity_) { /* resize */ }
			products_[size_++] = p;
		}

	private:
		int size_;
		int capacity_;
		Product* products_;
		};


int main() {
	Warehouse w1;
	Product book;
	Product apple;
	// ...assign values to products
	w1.add_product(book);
	Warehouse w2 = w1; // copy constructor will take effect
	w2.add_product(apple);

	std::cout << "Crisis averted. " << std::endl;
	/* EXPLANATION */
	// Without implementing Warehouse(const Warehouse& rhs){}, the add_product(const Product* p) function would place a pointer for w2 in the same memory location on the heap as w1.products_, thus leading to instability 
}
