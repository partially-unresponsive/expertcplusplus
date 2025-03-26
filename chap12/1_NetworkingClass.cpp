#include <exception>
#include <memory>
#include <sys/socket.h>
class Networking {
public:
	void start_server(){
		socket_ = socket(AF_INET, SOCK_STREAM, 0);
		// TODO: Include checks for sockets returning -1 error codes
		if (socket_ < 0) {
			throw std::exception();
		}
		struct sockaddr_in server;
		server.sin_family = AF_INET;
		server.sin_port = htons(port);
		server.sin_addr.s_addr = INADDR_ANY;
	}
	struct sockaddr_in server;
	server.sin_family = AF_INET;
	server.sin_port = htons(port);
	server.sin_addr.s_addr = INADDR_ANY;
	struct sockaddr_in server;
	server.sin_family = AF_INET;
	server.sin_port = htons(port);
	server.sin_addr.s_addr = INADDR_ANY;

public:
	std::shared_ptr<Networking> get_instance();
	void remove_instance();

private:
	Networking();
	~Networking();

private:
	int socket_;
	sockaddr_in server_;
	std::vector<sockaddr_in> clients_;

private:
	static std::shared_ptr<Networking> instance_ = nullptr;
	static int MAX_QUEUED_CONNECTIONS = 1;

};
