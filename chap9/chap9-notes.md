- For two threads to not interfer with each other, the operation shouldn't consist of more than one instruction.
- There is always a gap between two statements, and that gap will make two or more threads interfere with each other.
![[Pasted image 20250322140331.png]]
- If at least one thread is guaranteed to make progress, then we say it's a lock-free function.
![[Pasted image 20250322143612.png]]
- **Atomic operation** is an indivisible operation. It is an operation that can't be half-done: it's done or it isn't. (ex.: `num = 37` is an atomic operation, while `operator=()` for an user-defined class might not be, especially if it goes through multiple instructions to check things first, etc.) 
- A **non-atomic operation** might be seen as half-done, or consist of multiple instructions that can leave gaps where data can get corrupted in multithreading. 
```c++
int counter = 0;
void foo() { counter++; }
// counter++ is *not* an atomic operation. We can break it down to 3 parts:
// auto res = counter;
// counter = counter + 1;
// return res;
```
- In C++, all operations on atomic types are also atomic.
- Synchronization mechanisms such as **mutexes** incorporate overhead and performance penalties. Atomic types leverage lower-level mechanisms to ensure the independent and atomic execution of instructions. 
- The standard atomic types are defined in the `<atomic>` header, however standard atomic types might also use **internal locking**. To make sure they don't use internal locking, all atomic types in the STL expose their `is_lock_free()` function.
	- The only atomic type that doesn't have the `bool is_lock_free()` member function is `std::atomic_flag`. The operations on this type are required to be lock-free. 
	- `bool static constexpr is_always_lock_free()` returns `true` if the atomic type is lock-free for all supported hardware. As it's `constexpr`, it allows us to define whether the type is lock-free at compile time, which is a big advancement.
![[Pasted image 20250322144938.png]]
> Basic **atomic types** (`pag 323`)

## Operations on atomic types
- The goal of atomic types is to either eliminate gaps between instructions or provide operations that take care of combining several instructions together wrapped as a single instructions. The following are operations on atomic types:
```c++
atomic_int m;
m.store(42);   // atomically "stores" the value
std::cout << m.load();  // atomically "reads" the contents

// =============

exchange()  // comprises the store() and load() functions in a way that atomically replaces the value with the provided argument and atomically obtains the previous value

// =============

bool compare_exchange_weak(T& expected_value, T target_value, std::memory_order order = std::memory_order_seq_cst) noexcept; 
bool compare_exchange_strong(T& expected_value, T target_value, std::memory_order order = std::memory_order_seq_cst) noexcept;
// Both compare_exchange functions operate similarly
// They compare the first argument (expected_value) with the atomic variable and if they are equal, replace the variable with the second argument (target_value). 
// Otherwise, they atomically load the value into the first argument (that's why it is passed by reference). 
// The difference between weak and strong exchanges is that compare_exchange_weak() is allowed to fail falsely (called a **spurious failure**), that is, even when expected_value is equal to the underlying value, the function treats them as not equal. 
// That's done because on some platforms it leads to increased performance.

// =============
wait()
notify_one()
notify_all()

/*
Since C++20:
The wait() function blocks the thread until the value of the atomic object modifies. It takes an argument to compare with the value of the atomic object. If the values are equal, it blocks the thread. To manually unblock the thread, we can call notify_one() or notify_all(). The difference between them is that notify_one() unblocks at least one blocked operation, while notify_all() unblocks all such operations.
*/

/*
Now, let's discuss the memory order that we encountered in the atomic type member
functions declared previously. std::memory_order defines the order of memory accesses
around atomic operation. When multiple threads simultaneously read and write to
variables, a thread can read the changes in an order different from the order in which
another thread stored them. The default order for atomic operations is sequentially
consistent ordering – that's where std::memory_order_seq_cst comes in. 

There are
several types of orders, including memory_order_relaxed, memory_order_consume,
memory_order_acquire, memory_order_release, memory_order_acq_rel, and
memory_order_seq_cst. In the next section, we'll design a lock-free stack that uses atomic
types with the default memory order.
*/
```
- The atomic form of a pointer of type T is `std::atomic<T*>`. It provides the pointer to the arithmetic operations `fetch_add()` and `fetch_sub()`. They do atomic addition and subtraction on the stored adddress.
```c++
struct some_struct {};
T arr[10];
std::atomic<some_struct*> ap(arr);
some_struct* old = ap.fetch_add(2);
// now old is equal to arr
// ap.load() is equal to &arr[2]
```
![[Pasted image 20250322153617.png]]
> 

  `std::atomic<>` instantiated with an **integral type** offers more operations:
- `fetch_add()`
- `fetch_sub()`
- `fetch_or()`
- `fetch_and()`
- `fetch_xor()`
There is a special atomic type called `std::atomic_flag` with two available operations:
- `clear()` clears the bool
- `test_and_set()` changes the value to `true` and returns the previous value

- [ ] #TODO/linux Look into books from **these** publishers: O'Reilly, No Starch Press, and Pragmatic Bookshelf