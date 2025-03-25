- There are multiple **programming paradigms**:
	- **Procedural** - statements executed one after another
	- **Object-oriented** - decomposing a complex system into **intercommunicating objects**
	- ==**Functional**== - encourages to decompose the system into **pure functions** rather than objects
- C++ is a **multi-paradigm language**.
- **Unary predicate**: essentially a (**lambda**/anonymous) function, a function pointer (`(*foo)()`), or objects with an overloaded `operator()`. [Source](https://stackoverflow.com/questions/50450373/how-do-i-define-a-unary-predicate-for-copy-if-etc-in-c)
- **Pure functions** take an argument, processes it without modifying it, and returns a new value based on the input. It does __not__ keep or change any **state**. It has no side-effects.
- Each function is specialized to do one simple enough task without realizing the original problem. Functions are then composed together to generate a collection of transformed items from the raw initial input.
- **Ranges** are a traversable entity; that is, a range has a `begin()` and an `end()`. Every STL container can be treated as a range. STL algorithms are redefined to take ranges as direct arguments.
- **Ranges** are tied to **views**.

![[Pasted image 20250314121408.png]]
> **Piping ranges** (similar to the bash terminal) (`pag 261`)

![[Pasted image 20250314121634.png]]
> Proxy objects, **smart iterators**, **range views**, **lazy evaluation**, and the operation of `transform()` and `filter()`. (`pag 262`)

![[Pasted image 20250314122234.png]]
> Uses of functional programming, conciseness, **primitives**, **mutexes**, `[[gnu::pure]]` attribute (`pag 263`)

```c++
[[gnu::pure]] func_def (func_parameters) { /* code that you're *certain* acts as a pure function */ };
```
- In functional programming, functions are considered **first-class objects**
- **Higher-order functions** are functions that take other functions as arguments `f(g(x))`
- Whenever we overload the `operator()` of a class, we make it **callable**. Anything that is callable is treated as a function. 
- The object of a class that has an overloaded `operator()` could be considered a function (or **functor**).
```c++
#include <functional>
#include <iostream>

std::function<int (int, int)> get_multiplier() {
	return [](int a, int b) { return a * b; };
}

int main() {
	auto multiply = get_multiplier();
	std::cout << multiply(34, 41) << std::endl;
}
```
> A function that returns a `std::function<return-type (parameter-types)>`

- **Currying** is where we make a function take several arguments into several functions, each of which takes a single argument; for example, making `multiply(3, 5)` into `multiply(3)(5)`. Here's how:

```c++
std::function<int(int)> multiply(int a) {
	return [a](int b) { return a * b; };
}

int main() {
	std::cout << multiply(3)(5) << std::endl;
}
```

![[Pasted image 20250318205645.png]]
> Higher order functions using **currying** and **predicate objects**

- **Folding** (or **reduction**) is the process of combining a collection of values together to generate a reduced number of results. There is *left* or *right* folding based on the direction we process the collection elements in.
- Folding and recursion go hand in hand.
- 
```c++
std::vector<int> elems{1, 2, 3, 4, 5, 6};
std::find_if(elems.begin(), elems.end(), [](int el) {return el % 3 == 0;});

std::string str = "lowercase";
std::transform(str.begin(), str.end(), str.begin(),
[](unsigned char c) { return std::toupper(c); });
std::cout << str; // "LOWERCASE"

std::vector<double> elems{1.1, 2.2, 3.3, 4.4, 5.5};
auto sum = std::accumulate(elems.begin(), elems.end(), 0);

auto product = std::accumulate(elems.begin(), elems.end(), 1,
[](int prev, int cur) { return prev * cur; });

product = std::accumulate(elems.begin(), elems.end(), 1,
std::multiplies<int>());

std::reduce(std::execution::par, elems.begin(), elems.end(),
1, std::multiplies<int>());
```

- The last argument to `std::accumulate` is the **accumulator**. This is the initial value that should be used as the previous value for the first element of thge collection.
- [ ] #TODO `std::execution::par` 
- **Head recursion** (default) - makes the recursive call before processing the result at the current step.
- **Tail recursion** is the solution to the problem of having multiple unnecessary variables that we deal with in recursive functions. It is doing the actual processing *before* the recursive call.
- ![[Pasted image 20250318214921.png]]
- **Tail Call Optimization (TCO)** involves knowing that the second argument of the factorial function (the tail) can be stored at the same location for every recursive calls. It is a compiler optimization.
- **Metaprogramming** is where the code is being executed *during* the compilation of the code
```c++
#include <iostream>
template <int N>
struct MetaFactorial
{
  enum {
    value = N * MetaFactorial<N - 1>::value
  };
};

template <>
struct MetaFactorial<0>
{
  enum {
    value = 1
  };
};

int main() {
  std::cout << MetaFactorial<5>::value; // outputs 120
  std::cout << MetaFactorial<6>::value; // outputs 720
}
```
> Using compiler template optimizations, the following implementation of a **factorial** function will be computed at compile time, making it the fastest implementation possible

