![[Pasted image 20250217102148.png]]
>Memory structure of a `struct` (`page 71`)

![[Pasted image 20250217102312.png]]

![[Pasted image 20250217103212.png]]
>Problem domain and project requirements; necessary properties for different use cases/user groups (also accessible to **superusers**) (`page 74`)

![[Pasted image 20250217112303.png]]
>Complicated version of `class Product` (`page 79`)

- #TODO What the fuck do all of these things mean? Including the 3 constructor definitions, 2 operator "default" definitions, and then the `std::ostream& operator<< (std::ostream&, const Product&);` mean
![[Pasted image 20250217112824.png]]
>**Unified Modeling Language (UML)** class diagram (`page 80`)

![[Pasted image 20250217135231.png]]
>**Memory leak (!)** (`page 84`)

 - [ ] #TODO Return to this code and confirm there *is* a memory leak here
![[Pasted image 20250217141048.png]]
![[Pasted image 20250217141111.png]]
![[Pasted image 20250217141123.png]]
>Dangers of **shallow copy** over a **deep copy** when it comes to copying arrays/pointers through a declaration like `Warehouse w2 = w1;` (`page 88`)

![[Pasted image 20250217170938.png]]
>Tries to comment out problematic code, ends up with 70 more errors (lol)
  UPDATE: Found a fix for this in `6_moveobject.cpp`.
### Key Points
- `nullptr`
- Class constructors, destructors
- Copy constructor, move constructors
- `delete [] products_` (to delete array)
- `default` constructor/operator implementation
- Operator overloading
- Deep copy vs shallow copy of objects
- Temporary variables allocated by the stack
- Variables scope in the Stack
- Memory leak example due to deleted pointer to a non-deconstructed class instance
- [ ] `static` class instance operator #TODO
- `std::ostream& operator<<()` shenanigans
- "Client code"
- **Unified Modeling Language (UML)** class diagram
- Setter and getter class functions
- Class state and identity
- Class visibility modifiers: `public` and `private`
- Word-boundary addresses (compiler memory segments alignment, and **padding** for CPU speed optimization)
- Object **messages** (function calls between separate objects)
- Classes: Product, Warehouse

## Lvalue and Rvalue references (&&)
```c++
double pi{3.14}; // lvalue
double& ref{pi}; // lvalue-reference
// lvalue-reference is equivalent to:
double * const ref = &pi;
```
- When a variable is an **lvalue**, it can be addressed, it can be pointed to, and it has a scoped storage duration.
- `ref` is an `lvalue reference`, a synonym for a variable that can be treated as a `const` pointer.
- Besides the ability to modify the objects by a reference, we pass heavy objects to functions by reference in order to optimize and avoid redundant object copies.
- `lvalue` references optimize the code in terms of function calls, but, to optimize **temporaries**, we should move on to **rvalue references**

```c++
int get_it() {
	int it{42};
	return it;
}
// ...
int& impossible{get_it()}; // compile error
int&& possible{get_it()}; // rvalue reference; code works
```

```c++
int val;
void get_it() {
	val = 42;
}
void do_something() {
	// do something with the val
}
do_something();
```

```c++
class Warehouse {
	public:
// constructors omitted for brevity
	Warehouse(Warehouse&& src) // Move constructor using rvalue reference
	: size_{src.size_},
	capacity_{src.capacity_},
	products_{src.products_}
	{
		src.size_ = 0;
		src.capacity_ = 0;
		src.products_ = nullptr; // We assign nullptr to make sure the destructor will miss the allocated object
	}
	~Warehouse() { delete [] products_;} // Deconstructor
};
```
![[Pasted image 20250218132630.png]]
> Rvalues and move constructors changing the way `Warehouse large{small+mid};` operates (`page 93`)

## Operator Overloading
![[Pasted image 20250218132802.png]]
![[Pasted image 20250218132819.png]]
![[Pasted image 20250218132829.png]]
- [ ] #TODO Understand the `<compare> header` and the `spaceship operator <=>()`
- [ ] #TODO Understand the `std::strong_ordering` return types and others listed

## `static` class function
![[Pasted image 20250218134308.png]]
## Aggregates
![[Pasted image 20250220162558.png]]![[Pasted image 20250220162800.png]]
> Structured binding (`page 100`)

## Aggregation and Composition in OOP
![[Pasted image 20250220163238.png]]
### Liskov Substitution Principle
- [ ] #TODO Liskov Substitution Principle

## Virtual Functions
- Used in classes to be able to accomplish **polymorphism** - the ability for a subclass/derived class to *overwrite* its own implementation of a certain **virtual function**.
- ![[Pasted image 20250221100731.png]]
- **Pure virtual functions** are for when the base class should have *zero* implementation of a **virtual** member function, instead letting it be overridden by its derived classes. This makes the `Musician` class into an **interface**, and NOT an **abstract class**.
- An **abstract class** is a semi-interface semi-class that can have both types of functions: with and without implementation.
- When a class has virtual functions, it will turn into a data structure that has a *pointer* to a **virtual functions table (VTable*)**, known as `VTable* __vptr` 
- ![[Pasted image 20250221102404.png]]
- ![[Pasted image 20250221102606.png]]
- ## Design Patterns
- - **Singleton**: Design pattern when dealing with classes. It provides us a way to declare and use only **one** instance of the class, for projects that may require we include that class instance in many source files.
- ![[Pasted image 20250221104554.png]]
# FIN
---
