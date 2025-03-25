template <typename T>
class Vector
{
public:
	Vector() : buffer_{nullptr}, capacity_{2}, size_{0}
	{
		buffer_ = new T[capacity_]; // initializing an empty array
	}
	~Vector() { delete [] buffer_; }

public:
	void push_back(const T& item)
	{
		if (size_ == capacity_) {
			capacity_ *= 2;  // increase the capacity of the vector twice (arbitrary)
			T* temp_buffer = new T[capacity_];
			// copy elements of the old into the new
			for (int ix = 0; ix < size_; ++ix) {
				temp_buffer[ix] - buffer_[ix];
			}
			delete [] buffer_;  // free the old array
			buffer_ = temp_buffer;  // point the buffer_ to the new array
 		}
 		buffer_[size_++] = item;
	}
	void push_front(const T& item)
	{
		if (size_ == capacity_) {
			// resizing code omitted for brevity
		}
		// shifting all the elements to the right
		for (int ix = size_ - 1; ix > 0; --ix) {
			buffer_[ix] = buffer_[ix - 1];
		}
		// adding item at the front
		buffer_[0] = item;
		size_++;
	}

private:
	T* buffer_;
	int capacity_;
	int size_;
};
