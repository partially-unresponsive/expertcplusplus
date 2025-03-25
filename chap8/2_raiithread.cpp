#include <thread>
#include <iostream>
#include <utility>


class TestTask {
public:
	TestTask() = default;
	void operator()() { state_++; }
private:
	int state_ = 0;
};

class thread_raii {
public:
	explicit thread_raii(std::thread& t) : thread_(std::move(t)){}
	~thread_raii() {
		if (thread_.joinable()) { thread_.join(); }
	}

private:
	std::thread thread_;
};

void foo() { std::cout << "Testing thread join" << std::endl; }

int main() {
	std::thread t{TestTask()};
	thread_raii r{t};
	// will automatically join the thread

	// Alternatively, just use std::jthread
	std::jthread jt{foo};

}
