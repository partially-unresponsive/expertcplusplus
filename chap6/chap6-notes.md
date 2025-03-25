### Vectors (1D array)
![[Pasted image 20250304134109.png]]
>The **std::vector**, the dynamically growing one-dimensional array. Its elements can be accessed in real time.

- Vectors have good **data locality**. Reading the first elements of a vector involves copying the first $N$ elements into the cache. Further reads of vector elements will be even faster.
- This is _not_ true for linked lists.
![[Pasted image 20250312110912.png]]
> Pushing elements onto a vector (`pag 217`)
 
## Running Time (O(n) notation)
### Constant time: O(1) operation
![[Pasted image 20250304134305.png]]
>**O(1) operation:** Accessing the first element of the vector and accessing the 100th element of the vector take the same amount of time (constant).

- [x] #TODO Hash tables
- [ ] #TODO Look up a proper, full implementation of a Vector class object
### Linked list
![[Pasted image 20250311204516.png]]
> Functionality of `push_front()` in a Linked List (`pag 212`)

![[Pasted image 20250312105813.png]]
> Functionality of inserting an element in the *middle* of the list 

![[Pasted image 20250312111108.png]]
> Pushing new nodes onto a linked list (memory view) (`pag 220`)
  
  ![[Pasted image 20250312110729.png]]
  > **Data locality** is an example of a **locality of reference**, alongside **temporal locality**, **spatial locality**, **branch locality**, and **equidistant locality**
  
## STL Containers
### Using `std::vector` and `std::list`
```c++
#include <list>
#include <stdexcept>
#include <vector>
#include <iostream>

struct Point
{
	float x;
	float y;
	float z;

	Point(float px, float py, float pz) : x(px), y(py), z(pz) {}  // constructor
	Point(Point&& p) : x(p.x), y(p.y), z(p.z) {}  // move constructor
};

int main()
{
	// Section 1: std::vector<int>
	std::cout << "===VECTORS===" << std::endl;
	std::vector<int> vec;
	vec.reserve(32);  // sets the capacity of how many ints it can handle by reserving enough memory for 32 items
	vec.push_back(4);
	vec.push_back(2);
	vec.push_back(13);
	std::cout << "Regular const auto& elem loop" << std::endl;
	for (const auto& elem : vec)
	{
		std::cout << elem << std::endl;
	}
	std::cout << "The safe approach of accessing elements" << std::endl;
	std::cout << vec.at(2) << std::endl;  // .at() method has bounds checking
	try {
	  std::cout << vec.at(5) << std::endl;
	} catch (std::out_of_range& e) {
	  std::cout << "Vector element out of range :P" << std::endl;
	}
	std::cout << vec.data()[2] << std::endl;


	// Section 1b: std::vector<Point>
	std::cout << "std::vector<Point>" << std::endl;

	std::vector<Point> points;
	points.push_back(Point(1.1, 2.2, 3.3));
	points.push_back(Point(4.4, 5.5, 6.6));
	points.emplace_back(4.4, 5.5, 6.6);  // what does this do

	for (const auto& elem : points)
	{
		std::cout << "Point: (" << elem.x << ", " << elem.y << ", " << elem.z << ")" << std::endl;
	}

	// Section 2: std::list<double>
	std::cout << "===LINKED LIST===" << std::endl;
	std::list<double> lst;
	lst.push_back(4.2);
	lst.push_back(17.53);
	lst.push_front(3.14); // 3.14 -> 4.2 -> 17.53
	
	std::list<double> lst2;
	lst2.push_back(25.33);
	lst2.push_back(67.24);
	lst2.push_front(20.024);
	lst.merge(lst2);

	for (const auto& elem : lst)
	{
		std::cout << elem << std::endl;
	}

}

```

### Using container adapters
```c++
#include <queue>
#include <stack>
#include <iostream>

int main()
{
	std::cout << "===STACK (LIFO)===" << std::endl;
	std::stack<int> st;
	st.push(1);
	st.push(2);
	st.push(3);  // stack contains: 3 2 1
	std::cout << st.size() << std::endl;
	
	for (int i = 0; i <= st.size() + 1; ++i) 
	{
		std::cout << st.top() << std::endl;
		st.pop();
	}


	std::cout << "===QUEUE (FIFO)===" << std::endl;
	std::queue<char> q;
	q.push('a');
	q.push('b');
	q.push('c');
	std::cout << q.front() << std::endl;
	std::cout << q.back() << std::endl;
	q.pop();
	std::cout << q.front() << std::endl;
}
```
#### Stack
![[Pasted image 20250312125930.png]]
> Stacks are a **last-in, first-out (LIFO)** principle container adapter. (`pag 227`)
#### Queue
![[Pasted image 20250312125834.png]]
> Queues are a **first-in, first-out (FIFO)** container adapter. (`pag 228`)

- [x] Write a small program, using `std::stack`, to validate the parantheses here: ![[Pasted image 20250312130037.png]]
`int r = (a + b) + (((x * y) - (a / b)) / 4);`
Done:
```c++
/* Title: Stack practice exercise
*  Written by: CutieSai
*  Taken from: expertcplusplus (pag 229)
* 
*  This short program should validate the parantheses from this short string `r`, to make sure there is an equal amount of opened and close parantheses. It does nothing more.
*  It also will not check the *logic* of the expression, like r2 = "(a + b) + (x * y --+/)" will pass
*/

#include <stack>
#include <iostream>
#include <string>
#include <vector>

int main() { 
	std::string r = "(a + b) + (((x * y) - (a / b)) / 4);";
	std::stack<char> st;
	
	// Testing set r_list (just for myself, really)
	std::string r2 = "3 * a + (x - y) * (1 / (4.5 * x^2));";
	std::string r3 = "e^(3x + \\Int_(-2)^(3y)xlog(x)dx) + 2 * c;";
	std::vector<std::string> r_list = {r, r2, r3};

	for (const auto& str : r_list) {
		for (const auto& ch : str) {
			switch (ch) {
				case '(':
					st.push('(');
					break;
				case ')':
					st.pop();
					break;
			}
		}
	}

	if (st.size() == 0) {
		std::cout << "Success: Parantheses match" << std::endl;
	} else {
		std::cout << "Failure: Uneven number of parantheses" << std::endl;
		std::cout << "Unclosed parantheses count: " << st.size() << std::endl;
	}
}
```
### Iterating Containers
- An **iterator** is an object that points to the container element and can be advanced to the next element based on the physical structure of the container.
- A **container** is a collection of items. Containers provide a different set of operations for element access. For example, `std::vector` provides the `operator[]`, whereas `std::list` does not. The `std::list` has the `.front()` and `.back()` methods, which return the first and last elements, respectively. Also `.at()` method.
- Containers provide two member functions, `begin()` and `end()`, returning iterators to the beginning and the end of the container, respectively.
```c++
auto it_begin = std::begin(lst);
auto it_end = std::end(lst);
for ( ; it_begin != it_end; ++it_begin) {
	std::cout << *it_begin << std::endl;
}
```

```c++
std::vector<int> vec;
vec.push_back(4);
vec.push_back(2);
std::vector<int>::iterator it = vec.begin();
std::cout << *it; // 4
it++;
std::cout << *it; // 2

std::list<int> lst;
lst.push_back(4);
lst.push_back(2);
std::list<int>::iterator lit = lst.begin();
std::cout << *lit; // 4
lit++;
std::cout << *lit; // 2
```
#### Iterator categories (in STL)
- Input
- Output (the same as input, but supporting write access)
- Forward
- Bidirectional
- Random access (i.e., `std::vector`, like by doing `auto it = vec.begin(); std::cout << *(it + 3)`)
- Contiguous
![[Pasted image 20250312210854.png]]
> Iterator categories (STL) (`pag 232`)

## Concepts (C++20)
- Templates are the basis of **generic programming**. **Concepts** introduce even more flexibility to generic programming.
- ![[Pasted image 20250312215704.png]]
> Concepts and constraints (`page 236`)
![[Pasted image 20250312220042.png]]
> Using iterators in C++20 (`pag 237`)

### Mastering Algorithms
- An **algorithm** in the context of the STL implies a function processing a collection of data. **Collections of data** are presented in the form of **containers**, such as `std::vector, std::list` and others.
- Searching a **sorted** vector using the **binary search algorithm** will be much more efficient than using **sequential searching**. To compare the efficiency of algorithms, a so-called **asymptotic analysis** is performed, which takes into consideration the speed of the algorithm with regard to the input data size.
- The actual difference of algorithms shows itself when applied to '**big enough**' containers, having a one million or even one billion records. 
- Measuring the efficiency of an algorithm is also known as verifying its **complexity**.
- The **O()** function (pronounced *big-oh*) defines the complexity of an algorithm.
#### Searching
##### Sequential Searching
```c++
#include <vector>
template <typename T>
int searchr(const std::vector<T>& vec, const T& item){  // Sequential search, O(n) linear complexity
	for (int ix = 0; ix < vec.size(); ++ix) {
		if (vec[ix] == item) { return ix; }
	}
	return -1; // not found
}
```

![[Pasted image 20250312231012.png]]
> Sequential search, O(n) linear complexity (`pag 239`)

![[Pasted image 20250312231252.png]]
> The complexity of the sequential search algorithm $O(n(2C + I))$ (`pag 240`)

##### Binary search
  - The **binary search algorithm**: first, it looks for the middle element of the vector and compares the search key with it, and if it is equal, then the algorithm is done: it returns the index. Otherwise, if the search key is less than the middle element, it proceeds to the left of the vector. If the search key is greater than the middle element, the algorithm proceeds to the right-hand subvector.
  - The vector being searched through should be **sorted**.
![[Pasted image 20250312231751.png]]
> Binary search representation (`pag 242`)
```c++
#include <cstddef>
#include <vector>

// Recursive implementation of the binary search algorithm

template <typename T>
std::size_t binsearch(const std::vector<T>& vec, const T& item, int start, int end) {
	if (start > end) return -1;
	int mid = start + (end - start) / 2;
	if (vec[mid] == item) {
		return mid;  // found
	}
	if (vec[mid] > item) {
		return binsearch(vec, item, start, mid - 1);
	}
	return binsearch(vec, item, mid + 1, end);
}
```
![[Pasted image 20250312233544.png]]
> Binary search complexity is logarithmic $O(\log n)$ (`pag 243`)

#### Sorting
- A **sorting algorithm** takes a collection as an input and returns a new sorted collection (in the order defined by the user)
- ![[Pasted image 20250312234847.png]]
- The `std::sort` function can't be applied to `std::list` because it doesn't support random access iterators. Call the `sort()` member function of the list instead.
- We can pass a separate **comparator function** to the `std::sort` function, like so:  
```c++
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
```
##### Exploring trees and graphs
![[Pasted image 20250313110012.png]]
> Binary search trees with logarithmic complexity $O(\log n)$ and the `std::set` (`pag. 246`)
![[Pasted image 20250313110345.png]]
> `std::set` and `std::map`, two very efficient, logarithmic complexity $O(\log n)$ data structures based on a **balanced tree** (`pag 247`)

###### Hash Tables
- The **hash table** is the fastest data structure out there. It is based on the simple idea of a **vector indexing**. Imagine a big vector that contains pointers to lists:
```c++
std::vector<std::list<T>> hash_table;
```
- Access to vector elements takes **constant time**. By extension, accessing a hash table takes constant time. The hash table allows us to use any type as the key of the container.
- The basic idea of the hash table is to use a well-curated **hash function** that will generate a unique index for the input key.
- The STL supports a hash table named `std::unordered_map`
```c++
#include <unordered_map>
// ...
std::unordered_map<std::string, std::string> hashtable;
hashtable["key1"] = "value 1";
hashtable["key2"] = "value 2";
// ...
```
- [ ] #TODO Research into **hash functions**
![[Pasted image 20250313111139.png]]
> Hash table representation, `std::unordered_map`, and the `std::hash()` function (`pag. 248`)
###### Graphs
![[Pasted image 20250313111437.png]]
> Binary search trees, B-trees, and graphs (`pag 249`)

![[Pasted image 20250313111627.png]]
> Graph representation of a social network (A follows B, B follows C, C follows both of them back) (`pag 250`)

- A node is called a **vertex** in the graph.
- The link between two nodes is called an **edge**.
- There's no fixed graph representation, so we should choose from several.
- One of the best options to represent this social network is through a **hash table**.

###### Strings
- **Strings** are similar to vectors: they store characters, they expose iterators, and they are containers. 
- They specifically express one kind of data: strings. 
- The special `\0` character (also known as the **null character**) serves as **string termination**. The compiler reads characters one after the other until it encounters the null character.
- ![[Pasted image 20250313113747.png]]
- Use `std::string` from the STL
- Algorithms defined in `<algorithm>` header are also applicable to strings
$$\text{Fin.}$$
---
