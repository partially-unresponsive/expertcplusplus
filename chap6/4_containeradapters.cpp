#include <queue>
#include <stack>
#include <iostream>

int main()
{
	std::cout << "===STACK (LIFO)===" << std::endl;
	std::stack<int> st;
	st.push(1);
	st.push(2);
	st.push(3);  // stack contains: 3 2 1
	std::cout << st.size() << std::endl;
	
	for (int i = 0; i <= st.size() + 1; ++i) 
	{
		std::cout << st.top() << std::endl;
		st.pop();
	}


	std::cout << "===QUEUE (FIFO)===" << std::endl;
	std::queue<char> q;
	q.push('a');
	q.push('b');
	q.push('c');
	std::cout << q.front() << std::endl;
	std::cout << q.back() << std::endl;
	q.pop();
	std::cout << q.front() << std::endl;

}
