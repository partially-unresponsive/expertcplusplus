#include <memory>
#include <mutex>
#include <stack>
#include <stdexcept>
#include <utility>
template <typename T>
class safe_stack {
public:
	using locker = std::lock_guard<std::mutex>;
	safe_stack();
	safe_stack(const safe_stack& other){
		locker lock(other.mutex_);
		wrapper_ = other.wrapper_;
	}
	
	void push(T value){
		locker lock(mutex_);
		wrapper_.push(std::move(value));
	}  // we will std::move it instead of copy-referencing
	std::shared_ptr<T> pop(){
		locker lock(mutex_);
		if (wrapper_.empty()) {
			throw std::runtime_error("The stack is empty");
		}
		std::shared_ptr<T> top_element {std::make_shared<T>(std::move(wrapper_.top()))};
		// 1. Get the std::stack wrapper_'s top element through the built-in .top() method
		// 2. Use std::move to static_cast<rvalue-reference> of the returned object
		// 3. Use std::make_shared to allocate the memory for and return a std::shared_ptr
		// 4. Assign that to variable top_element
		wrapper_.pop();
		return top_element;
	}
	T& top();
	bool empty() const;

private:
	std::stack<T> wrapper_;
	mutable std::mutex mutex_;
};
