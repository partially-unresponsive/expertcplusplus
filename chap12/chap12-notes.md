```ad-warning
The information here is OUTDATED. 
Learn from a proper socket networking textbook instead.
```
- Two computers interact together using **networks**.
- Computers connect to the internet using as pecial hardware component called a **network adapter (network interface controller)**
- The OS provides **drivers** to work with the network adapter; that is, to support network communications the computer must have a **network adapter** installed with an OS that supports the **networking stack**. By **stack**, we mean the layers of modifications that the piece of data goes through when traveling from one computer to another.
- **Layering** is essential in networking. **Network communication** as we know it today consists of several layers conforming to the **OSI (Open System Interconnection) model**.
- The OSI model aims to standardize communication functions between a wide range of devices. The layers that we mentioned earlier are as follows:
	- **Application layer**: This processes the details of the particular application
	- **Presentation layer**
	- **Session layer**
	- **Transport layer**: This provides data transmission between two hosts
	- **Network layer**: This handles the transferal of packets around the network
	- **Data-link layer**: This includes the device driver in the OS, along with the network adapter inside the computer
	- **Physical layer**
- ![[Pasted image 20250325210527.png]]
- **Transmission Control Protocol/Internet Protocol (TCP/IP)** are parts of the low-level details of the network communication, provided by the OS.
- Whenever an application needs to access the network, whether it's a **local area network (LAN)** or the **internet**, it requests the operating system to provide an access point. The OS manages to provide a **gateway** to the network by utilizing a network adapter and specific software that speaks to the hardware.
- ![[Pasted image 20250325210829.png]]
- The OS provides an **API** to work with its **networking subsystem**. The main abstraction that programmers care about is the **socket**. We can treat a socket as a file that sends its contents through the network adapter. **Sockets** are the access points that connect two computers via the network. 
- The **socket** is a structure that allows us to implement data through the **network** in applications. The socket is a connection point that either **sends** or **receives data**.
- ![[Pasted image 20250325211157.png]]
  > The **server**, **client socket**, facebook.com example
- **Internet Protocol (IP) address** is the (unique) location that we need in order to transfer data to the device. A connection is established using the **IP protocol**. An IP address consists of four groups of 1-byte length numbers, in the form `X.X.X.X` (e.g., `101.20.11.42:80`)
- More specifically, it's a **version 4 IP address (IPv4)**. Modern systems use a **version 6 address (IPv6)**. 
- To create a connection between two devices, we use two sockets. We use the **port number** (port 80, in the FB example) to differentiate between them. The OS cannot assign more than `65536` unique port numbers to sockets (2-byte length number limit).
- There are port numbers that are **reserved** for specific applications. These ports are called **well-known ports** and range from 0-1023. They are reserved for **privileged services**. 
- The **HTTP server's port** number is **80**. That doesn't mean it can't use other ports.
- **Portable Operating System Interface (POSIX)** sockets, also known as **Berkeley (BSD) sockets**
- The following code creates a socket: 
```c++
import <sys/socket.h>

int s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
```
- `AF_INET`, `SOCK_STREAM`, and `IPPROTO_TCP` are numeric values. We use the first to specifiy the IPv4 protocol, the second parameter specifies the type of the socket (**stream-oriented** or **datagram** socket, here we chose **stream**). The last specifies the **Transmission Control Protocol (TCP)** represents a reliable stream-oriented protocol.
- A **network protocol** is a collection of rules and data formats that define intercommunication between applications. For example, a web browser and a **web server** communicate via **Hyper-Text Transfer Protocol (HTTP)**. HTTP is more like a set of rules than a transport protocol. 
![[Pasted image 20250325231617.png]]
> IP header and **IP packet** memory diagram

- The **IP header** weighs 20 bytes. It combines necessary flags and options for delivering a packet. In the domain of the IP protocol, we usually call a packet a **datagram**.
- Each protocol at the higher level appends **meta-information** to the data that's sent and received via the network; for example, TCP data is encapsulated in an IP datagram.
- [ ] #TODO **Request for Comments (RFCs)**: RFC 791 (Internet Protocol), RFC 793 (TCP)
![[Pasted image 20250325232548.png]]
> **Transmission Control Protocol (TCP) header**

In practice, TCP is used due to its following features:
- Retransmission of lost data
- In-order delivery
- Data integrity
- Congestion control and avoidance

- **IP** (Internet Protocol) is __not__ reliable. It doesn't care for lost packets, which is why TCP handles the retransmission of lost packets. It marks each packet with a unique identifier that should be acknowledged by the other side of the transmission. If the sender does not receive an **acknowledgment code (ACK)** for a packet, the protocol will **resend** the packet (a limited number of times).
- It is also crucial to receive packets in the proper order. TCP reorders received packets to represent correctly ordered information. That's why, when listening to music online, we don't listen to the end of the song at its beginning.
- Retransmission of packets might lead to another problem known as **network congestion**. This happens when a node doesn't manage to send packets fast enough.  It maintains a **congestion window** - a factor that determines the amount of data that can be sent out. Using the **slow-start mechanism**, TCP slowly increases the congestion window after initializing the connection.
- **User Datagram Protocol (UDP)** doesn't guarantee we can deliver packets properly and without losses, but it is faster. Applications that require fast communication tend to rely on UDP (e.g., video call applications or online games). Even if a couple packets get lost during the transmission, it won't affect the user experience :Clueless:
![[Pasted image 20250326101737.png]]
> **Three-way handshake** for TCP, **SYN (Synchronize), SYN-ACK, ACK packets**

![[Pasted image 20250326101828.png]]
> TCP Socket flow diagram (client socket, server socket)

```c
import <sys/socket.h>
int s = socket(AF_INET, SOCK_STREAM, 0);
struct sockaddr_in server;
server.sin_family = AF_INET;
server.sin_port = htons(port);
server.sin_addr.s_addr = INADDR_ANY;
bind(s, (struct sockaddr*)&server, sizeof(server));
```
> Creation and binding of a TCP server socket
> The first call creates a socket. The third parameter is set to 0, meaning that the default protocol will be selected based on the type of the socket. The type is passed as the second parameter, SOCK_STREAM, which makes the protocol value equal to IPPROTO_TCP by default. The bind() function binds the socket with the specified IP address and port number. We specified them in the sockaddr_in structure, which combines network address-related details in it.

![[Pasted image 20250326102923.png]]
> **Little-endian (Big-endian) byte ordering**, host byte order, network byte order, `listen()` socket function, `SOMAXCONN` constant

![[Pasted image 20250326103242.png]]
> **Backlog number**,  socket `accept()` function, `sockaddr_in` struct, **blocking** call, socket `recv()` function

```c
import <sys/socket.h>
struct sockaddr_in client;
int addrlen;
int new_socket = accept(s (struct sockaddr_in*)&client, &addrlen);
// use the new_socket
```

```c
import <sys/socket.h>
char buffer[BUFFER_MAX_SIZE];  // define the constant based on the specifics of the server
recv(new_socket, buffer, sizeof(buffer), 0);
// now the buffer contains received data
```

```c
char msg[] = "From server with love";
send(new_socket, msg, sizeof(msg), 0);
```
> Sending data over the socket using `send()`




---