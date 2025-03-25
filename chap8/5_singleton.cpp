#include <mutex>
class MySingleton {
public:
	static MySingleton* get_instance() {
		if (instance_ == nullptr) {
			instance_ = new MySingleton();
		}
		return instance_;
	}

private:
	std::mutex mutex_;
	static MySingleton* instance_;
};
