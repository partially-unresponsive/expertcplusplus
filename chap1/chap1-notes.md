### Building and running programs 
![[Pasted image 20250209234314.png]]
- The **compiler** is a tool that translates the source code into a runnable program (executable file/**executable**). This process is called **compilation**.
- Compiling a C++ program is a sequence of complex tasks that results in **machine code** generation.
- Machine code is the native language of the computer.
- Typically, a C++ compiler parses and analyzes the source code, then generates intermediate code, **optimizes** it, and finally, generates machine code in a file called an **object file** (file.o)
- These object files are then linked together by a tool called the **linker** to form a single executable file. The linker uses additional info stored in object files to link them properly.

![[Pasted image 20250210001237.png]]
> C++ compilation process (`page 14`) 
![[Pasted image 20250210001910.png]]
>`pag. 17`

- **ELF (Executable and Linkable Format)** is the Linux structure for an object file22