#include <memory>

int main() {
	std::allocator<int> IntAlloc;
	int* ptr = IntAlloc.allocate(5);
	// Construct an integer at the second position
	std::allocator_traits<IntAlloc>::construct(IntAlloc, ptr + 1, 42);
	IntAlloc.deallocate(ptr, 5);  // deallocate all
}
