template <typename T>
struct node {
	node(const T& it) : item{it}, next{nullptr}, prev{nullptr} {}
	T item;
	node<T>* next;
	node<T>* prev;
};

template<typename T>
class LinkedList {
	// code omitted for brevity
public:
	void push_front(const T& item)
	{
		node<T>* new_node = new node<T>{item};
		if (head_ != nullptr) {
			new_node->next = head_->next;
			if (head_->next != nullptr) {
				head_->next->prev = new_node;
			}
		}
		new_node->next = head_;
		head_ = new_node;
	}
	void push_back(const T& item)
	{
		node<T>* new_node = new node<T>(item); 
		if (head_ != nullptr) {
			node<T>* iter_node = head_->next;
			// new_node->prev = head_->next;
			while(iter_node->next != nullptr) {
				
			}
		}
	}
private:
	node<T>* head_;
};
