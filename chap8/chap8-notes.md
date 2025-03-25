- [ ] #TODO Research **POSIX (Portable Operating System Interface)**
- **Concurrency support** depends on the memory model of the language, that is, a set of guarantees for concurrent access to memory. Although the **byte** is the smallest addressable memory unit, the CPU works with **words** in data. The **word** is the smallest unit the CPU reads from or writes to memory.
- The C++ memory model guarantees that two threads can access and update separate memory locations without interfering with each other. 
- A **memory location** is a scalar type. A **scalar type** is an arithmetic type, pointer, enum, or `nullptr_t`. The largest sequence of adjacent **bit-fields** of non-zero length is considered a memory location too.
```c++
struct S
{
char a;           // location #1
int b: 5;         // location #2
unsigned c: 11;
unsigned :0;      // :0 separates bit fields
unsigned d: 8;    // location #3
struct {
int ee: 8;
} e;              // location #4
};
```

- **Concurrency** is usually confused with **multithreading**. They are similar in nature but different concepts in detail. Imagine **concurrency** as two operations whose running time interleave together. 
- **Parallelism** depends on your computer's hardware and CPU cores.
- A **process** is an image of a program running in the memory. When we start a program, the OS reads the content of the program from the hard disk, copies it to memory, and points the CPU to the starting instruction of the program. The process has its private virtual address space, stack, and heap. Two processes don't interfere with each other in any way. That's a guarantee provided by the OS.
- [ ] #TODO **Interprocess Communication (IPC)**
![[Pasted image 20250319140430.png]]
> Processes, CPU cores, multiprocessing, concurrency $\subset$ concurrency

![[Pasted image 20250319140614.png]]
> **Active** and **waiting** processes, **context switching**


![[Pasted image 20250319140738.png]]
![[Pasted image 20250319140813.png]]
![[Pasted image 20250319141102.png]]
> Scheduling processes happens using **priority tables**. System processes have higher priority than user processes. Processes are not aware of each other.

![[Pasted image 20250319141221.png]]
> Single-CPU systems versus multi-CPU systems on **context switching**

![[Pasted image 20250319142632.png]]
> Having a memory segment shared between processes for Interprocess Communication (IPC). **Threads**, **thread of execution**

- **Multithreading** aims to run functions concurrently to achieve better performance. It makes more sense than using IPC in **multi-process projects**.
- **Threads of execution (threads)** are exact ways of running tasks concurrently. Each process has a single thread of execution, sometimes called the **main thread**. A process can have more than one thread, and that's why we call it **multithreading**. Threads run in almost the same way as processes. They also have context switching.
- Threads run separately from each other, but they share most of the resources of their process because all the threads belong to the process.
- Threads *don't* share the stack. Each thread has its portion of the stack. The heap is shared between threads.
- `std::packaged_task` is similar to `std::function`. It wraps a callable object -- a function, lambda, function object, or **bind expression**. The difference with `std::packaged_task` is that it can be invoked **asynchronously**.
- ![[Pasted image 20250319181424.png]]
> `hardware_concurrency()`, multithreading CPU core diagram

```c++
#include <iostream>
#include <thread>
void print_numbers_in_background()
{
	auto ix{0};
	while (ix < 1000) {
		std::cout << "Background: " << ix++ << std::endl;
	}
}

int main()
{
	std::thread background{print_numbers_in_background};
	auto jx{0};
	while (jx < 500) {
		std::cout << "Main: " << jx++ << std::endl;
	}
}
```
> Note that the above program will become **Aborted (core dumped)** due to the **background thread** operating *after* the `main()` function is already over. I'm guessing adding an async-await would help

```c++
#include <iostream>
#include <thread>
void print_numbers_in_background()
{
	auto ix{0};
	while (ix < 100) {
		std::cout << "Background: " << ix++ << std::endl;
	}
	std::cout << "Background thread finished" << std::endl;
}

int main()
{
	std::thread background{print_numbers_in_background};
	auto jx{0};
	while (jx < 50) {
		std::cout << "Main: " << jx++ << std::endl;
	}
	std::cout << "Main() finished" << std::endl;
	background.join();
	std::cout << "background.join()" << std::endl;
}
```
> Using `std::thread.join()` function works to fix the above issue!

- The opposite of `std::thread.join()` (which waits for the background thread to complete before continuing execution) is `std::thread.detach()`, when the caller isn't interested in waiting for the thread to finish.
![[Pasted image 20250319191800.png]]
> The `explicit` constructor specifier and its effects

- Prefer to use `std::jthread` instead of regular threads
- The thread constructor copies the values passed to it and then passes them to the thread function with `rvalue` references. This is done to work with **move-only types**. When passing big objects through a thread, we need to use `std::ref()` to emphasize that the argument should be passed by reference. `std::jthread thr{make_changes, std::ref(big_object)};`
![[Pasted image 20250319193914.png]]
> **Thread pools** (essentially just a list/container of threads), caching threads

![[Pasted image 20250320205656.png]]
> **Web server** - a program that waits for incoming client connections and creates a separate connection for each client to be processed independently from others. The overhead of creating a new thread each time ho handle the client requests can be replaced with using a **thread pool**

![[Pasted image 20250320211516.png]]
> **Race condition**, **atomic operation** 

![[Pasted image 20250320211658.png]]
> **Mutex**, **lock guard**, `std::mutex`, `std::lock_guard`

![[Pasted image 20250320211836.png]]
> **Deadlocks**, `std::lock`, `std::adopt_lock`

![[Pasted image 20250320212045.png]]
> **Event-driven development**, **event loop**, asynchronous programming

![[Pasted image 20250320213213.png]]
> **Double-Checked Locking pattern**, **Singleton**

- If we deal with an asynchronous function, its return value is considered something called a **promise** or **promise object**. It's the way the system notifies us when the asynchronous function has completed. The promise object has three **states**:
	- **Pending**: the promise is not yet rejected nor fulfilled
	- **Rejected**: the promise encountered an error
	- **Fulfilled**: the function is done and the result is ready to be processed
- **Coroutines** (C++20) move the background execution of the code to the next level; they allow a function to be paused and resumed when necessary. It is a function that can be:
	- Started
	- Paused
	- Resumed
	- Finished
- To make a function a **coroutine**, you need one of the keywords: `co_await`, `co_yield`, or `co_return`. 
	- `co_await` is a construct telling the code to wait for asynchronously executing code. It means the function can be suspended at that point and resume its execution when a result is ready.
```c++
task<void> process_image() {
	image im = co_await request_image("url");
	// do something useful with the image
}
```
> Network code utilizing a **socket** 

- Coroutines are **stackless**. Instead of pushing anything to the stack, they save their state in the **heap** and recover it when resumed. **Stackful coroutines** also exist, referred to as **fibers**.
- Coroutines are connected to **callers**. The function that calls `process_image()` transfers execution to the coroutine and the pause by the coroutine (also known as **yielding**) transfers the execution back to the caller.