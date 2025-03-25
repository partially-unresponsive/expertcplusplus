- Meta Language (ML)
- Chartered Life Underwriter (CLU)
## Function Templates
### Syntax
`template <typename identifier_1, ..., typename identifier_n> function_declaration`

or

`template <class identifier_i1, ..., class identifier_n> function_declaration;`

```c++
#include <iostream>

template <typename T>
T app_max (T a, T b) {
	return (a > b ? a : b);
}

int main(){
	double num1 = 443.53;
	double num2 = 74.21;
	std::cout << app_max<double>(num1, num2) << std::endl;
}
```
## Instantiation
### Explicit instantiation
- **Before** C++11: ![[Pasted image 20250221113133.png]]
- **Since** C++11: ![[Pasted image 20250221113221.png]]
- ![[Pasted image 20250221114827.png]]
## Class Templates
### Syntax
```c++
[export] template <template_parameter_list> class-declarations
```

```c++
template <class T>
class V {
public:
	V(int n = 0) : m_nEle(n), m_buf(0) { createBuf();}
	~V(){ deleteBuf(); }
	V& operator = (const V &rhs) { /* ... */}
	V& operator = (const V &rhs) { /* ... */}
	T getMax() { /* ... */}
protected:
	void createBuf() { /* ... */ }
	void deleteBuf() { /* ... */ }
public:
	int m_nEle;
	T * m_buf;
};
```

### Explict Instantiation
```c++
extern template class template_name < argument_list >;  // Since C++11
```
### Summary
![[Pasted image 20250222151255.png]]
## Variadic Templates
> Since C++11, standard generic functions and class templates can accept a variable number of type paramteres. These are called **variadic templates**.
### Syntax
```c++
// a class template with zero or more type parameters
template <typename... Args> class X { ... };
// a function template with zero or more type parameters
template <typename... Args> void foo (function param list) { ... }

template <typename A, typename... Rest> class Y { ... }
```

![[Pasted image 20250224205050.png]]
![[Pasted image 20250224205136.png]]
- [ ] #TODO Explore this code and see if you still understand how it works ![[Pasted image 20250224210034.png]]
## Template Parameters
### Non-type template parameter
![[Pasted image 20250224210451.png]]
![[Pasted image 20250224210503.png]]
- [ ] #TODO Learn what **linkage** means
- [ ] #TODO Learn what **inline** function modifier means
### Template template parameter
![[Pasted image 20250228132155.png]]
![[Pasted image 20250228132202.png]]
- The ==`__PRETTY_FUNCTION__`== part is a GCC compiler exclusive to print out the name of the function (including the template version) to the `ostream&`, aka standard output ![[Pasted image 20250228132359.png]]
- ![[Pasted image 20250228142017.png]]
- ## Boost Standard Library
- ![[Pasted image 20250228150353.png]]
- [ ] #TODO Look into **Boost C++ Library** and get some information on its uses 
- ![[Pasted image 20250228151142.png]]
> Behemoth of a thing, and quite complex, but *this* is a more memory-efficient implementation of the **C++ STL** `copy()` function (`page 158`)
- [ ] #TODO Research "Curiously Recurring Template Pattern (CRTP)"