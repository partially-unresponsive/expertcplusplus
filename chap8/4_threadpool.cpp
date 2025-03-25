#include <exception>
#include <queue>
#include <thread>

class ThreadPool {
public:
	ThreadPool(int number_of_threads = 1000) {
		for (int ix = 0; ix < number_of_threads; ++ix) {
			pool_.push(std::thread());
		}
	}
	std::thread get_free_thread() {
		if (pool_.empty()) {
			throw std::exception();
		}
		auto th = pool_.front<std::thread>();
		pool_.pop();
		return th;
	}

	void push_thread(std::thread& t) {
		pool_.push(t);
	}


private:
	std::queue<std::thread> pool_;
};


