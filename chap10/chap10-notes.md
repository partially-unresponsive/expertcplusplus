Whenever you are starting a new project, the following steps should be taken into account:
1. Requirements gathering and analysis
2. Specification creaction
3. Design and test planning
4. Coding
5. Testing and stabilization
6. Release and maintenance
![[Pasted image 20250322211630.png]]
> Interaction diagrams

```c++
if (!std::regex_match(email, std::regex("(\\w+)(\\.|_)?(\\w*)@(\\w+)(\\.(\\w+))+")) {
	throw std::invalid_argument("Invalid email");
}
```
> Email regex

- There are different types of tests, such as **unit tests, regression tests, smoke tests**, and so on.
- **Quality Assurance (QA)** engineers meticulously test the project 
- **SOLID** stands for the following principles:
	- Single responsibility
	- Open-closed
	- Liskov substitution
	- Interface segregation
	- Dependency inversion
- **Single responsibility**: The single responsibility principle states the simple, that is, one object, one task. ==Try to reduce the functionality of your objects and their relationship complexity==. Make each object have one responsibility even though it's not always easy to dissect a complex object into smaller and simpler components. Single responsibility is a context-bound concept.
- The **open-closed principle** states that a class should be open for extension but closed for modification. It means that ==whenever you need new functionality, it's better to extend the base functionality instead of modifying it==. 
- The **Liskov substitution principle** is about inheriting from a type the right way. In simple words, ==if there is a function that takes an argument of some type, then the same function should take an argument of the derived type==.
- The **interface segregation principle** suggests ==dividing a complex interface into simpler interfaces==. This segregation allows classes to avoid implementing an interface they don't use.
- Finally, **dependency inversion** states that ==objects should not be strongly coupled==. It allows switching to an alternate dependency easily. 

![[Pasted image 20250324220819.png]]
- Dividing the application into layers allows handling the complexity of it in general. It's much better to orchestrate objects having single responsibility. The domain-driven design differentiates entities from objects that don't have a conceptual identity. The latter are known as **value objects**. For example, users do not distinguish between each unique transaction; they are only concerned about information that a transaction represents. On the other hand, a user object has a conceptual identity in the form of a User class (the entity).
- Operations permitted on objects using other objcets (or not) are named **services**. A servise is rather an operation that is not tied to a specific object.

- Finally, domain-driven design intensively incorporates repository and factory patterns. 
- The **repository pattern** is responsible for methods for retrieving and storing domain objects. 
- The **factory pattern** creates domain objects. Using these patterns allows us to interchange alternative implementations if and when needed. 

![[Pasted image 20250324222327.png]]
> Facade, factory **design patterns**

![[Pasted image 20250324222945.png]]
> The factory method pattern









 