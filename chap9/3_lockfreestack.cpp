#include <atomic>
template <typename T>
class lock_free_stack {
public:
	void push(const T& data) {
		node* new_elem = new node(data);
		new_elem->next = head_.load(); // Atomic "read" operation
		while (!head_.compare_exchange_weak(new_elem->next, new_elem)); // Ensures that the head_ pointer has the same value as we stored in new_elem->next. If it is, we set it to new_elem. Once compare_exchange_weak() succeeds, we are sure the node has been successfully inserted into the list
	}
	void pop(T& popped_element) {
		node* old_head = head_.load();
		while (!head_.compare_exchange_weak(old_head, old_head->next));
		popped_element = old_head->data;
	}


private:
	struct node {
		T data;
		node* next;
		node(const T& d) : data(d) {}
	};

	std::atomic<node*> head_;
};
