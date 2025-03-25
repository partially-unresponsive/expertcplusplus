# Chapter Notes


![[Pasted image 20250325111026.png]]
> Complex interaction diagram

![[Pasted image 20250325111224.png]]
> Complete interaction diagram of the game

![[Pasted image 20250325111439.png]]
> `CharacterUnit` and `Reader` class interfaces (UML)

- Developers categorize design patterns into **creational, structural,** and **behavioral categories**. 
- The **Command pattern** is a behavioral design pattern, mainly concerned with providing flexibility in communication between objects. In this context, the Command pattern encapsulates an action in an object that contains the necessary information, along with the action itself. This way, the Command pattern behaves as a **smart function**. The simplest way to implement it in C++ is by overloading the `operator()` for a class.
- A class with an overloaded `operator()` is sometimes referred to as a **functor**. 
![[Pasted image 20250325120151.png]]
> The **Command** interface, **subscriber**, the **Observer pattern**, **resources**, **subscriber**, **resource collected** event

- The **Observer** involves implementing a class that stores its subscribers and calls the specified function on an event. It consists of two entities: a **subscriber** and a **publisher**. The number of subscribers is not limited to one.

![[Pasted image 20250325123210.png]]
> The **Mediator** behavioral pattern

- The **Mediator** behavioral pattern. Objects communicate with each other via a mediator object. An object that triggers an event lets the Mediator know about it. The Mediator then passes the messages to any related object that's "subscribed" to the object state.

![[Pasted image 20250325123629.png]]
> The **Flyweight structural design pattern**

- **Structural patterns** take care of assembling objects and classes into larger, more flexible, structures. **Flyweight** allows us to **cache objects** by sharing their common parts.
- The **Flyweight** pattern suggests decomposing a heavy object into two:
	- An **immutable** object that contains the same data for each object of the same kind
	- A **mutable** object that uniquely identifies itself from others
- We store the values that are unique to each unit in a `CharacterUnit` object. These values change over time. The dimensions and sprite are constant, so we can keep a single object with these values. This immutable data is called the **intrinsic state**, while the mutable part of the object (the `CharacterUnit`) is called the **extrinsic state**.
- ![[Pasted image 20250325131108.png]]
- The **Prototype pattern** lets us create duplicates of objects independently of their type.
- A common term for one iteration of the game loop is a **frame**. **FPS (frames per second)** describes the speed of the gameplay. A game running at 60FPS requires each frame to be ~16ms.
- 



# Readers and Disturbers 
## Documentation
- A 2D strategy game with a limited set of resources
- Resources used to create buildings for game characters (**units**)
- Units:
	- Readers - smart characters who build **libraries** and other buildings
		- HP: 10
	- Professor - a powerful unit that can destroy 3 enemy soldiers at once
	- Soldier - fights
		- HP: 12
		- Power: 3
- Enemies:
	- Disturbers - attacks readers inside their libraries
- Buildings:
	- Library - can host up to 10 readers. If the player moves 10 readers into the library, after $\Delta t$, the library produces one **professor**.
	- Barracks - spawns soldiers
	- House - spawns 1 reader every 5 minutes
### Starting Point
- 1 house
- 2 soldiers
- 3 readers
### Technical Requirements
#### Units

#### Buildings

#### Game map
##### Coordinates
