- **Root Cause Analysis (RCA)** is a systematic process that's used to identify the fundamental cause of a problem. With the help of associated proper tools, it tries to identify the origin of the primary cause of the problem using a specific set of steps.
![[Pasted image 20250326111142.png]]
- [ ] #TODO `span`  
- **GDB (GNU Debugger)** - a free and open source **Command-Line Interface (CLI)** debugger
![[Pasted image 20250326112020.png]]
> Debugging tools on different platforms (GDB, Eclipse, Valgrind, Affinic, DDD, GDB, KDevelop, Nemiver, SlickEdit) and for Windows (Visual Studio, GDB (Cygwin, MinGW), Eclipse)

- **Native debugging** - both programs run on the same machine
- **Remote debugging** - GDB runs on a host machine, while the debugged program runs on a remote machine
- **Simulator debugging** - GDB runs on a host machine, while the debugged program runs on a simulator
- Run `g++ -g ch13_gdb_1.cpp -o ch13_gdb_1.out` using the `-g` flag to include the debugging information in the output binary file
- Run `gdb ch13_gdb_1.out` ![[Pasted image 20250326113157.png]]
```sh
[CutieSai@chastitycage]~/chastity_vault/chastity_vault/Coding/Projects/expertcplusplus/chap13$ gdb unsignedry.out 
GNU gdb (GDB) 16.2
Copyright (C) 2024 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from unsignedry.out...
(gdb) b main
Breakpoint 1 at 0x1141: file 1_unsignedry.cpp, line 5.
(gdb) n
The program is not being run.
(gdb) run
Starting program: /home/CutieSai/chastity_vault/chastity_vault/Coding/Projects/expertcplusplus/chap13/unsignedry.out 
This GDB supports auto-downloading debuginfo from the following URLs:
  <https://debuginfod.archlinux.org>
Enable debuginfod for this session? (y or [n]) y
Debuginfod has been enabled.
To make this setting permanent, add 'set debuginfod enabled on' to .gdbinit.
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib/libthread_db.so.1".
Breakpoint 1, main () at 1_unsignedry.cpp:5
5		float x = 10, y = 20;
(gdb) n
6		float z = multiple(x, y);
(gdb) step
multiple (x=10, y=20) at 1_unsignedry.cpp:12
12		float ret = x + y;  // bug, should be: ret = x * y;
(gdb) n
13		return ret;
(gdb) p s
No symbol "s" in current context.
(gdb) p z
No symbol "z" in current context.
(gdb) p ret
$1 = 30
(gdb) n
14	}
(gdb) n
main () at 1_unsignedry.cpp:7
7		printf("x=%f, y=%f, x*y = %f\n", x, y, z);
(gdb) n
x=10.000000, y=20.000000, x*y = 30.000000
8		return 0;
(gdb) n
9	}
(gdb) n
__libc_start_call_main (main=main@entry=0x555555555139 <main()>, argc=argc@entry=1, 
    argv=argv@entry=0x7fffffffe6b8) at ../sysdeps/nptl/libc_start_call_main.h:74
74	 exit (result);
(gdb) n
[Inferior 1 (process 7805) exited normally]
(gdb) q
```
**GDB (GNU Debugger)** commands:
- `break` (`b`) to create a **breakpoint** (ex: `break main` to create a breakpoint in the main() function)
- `run` (`r`) to **run** the program
- `next` (`n`) to move to the **next** line 
- `step` (`s`) to **step** into a subroutine
- `print` (`p`) to **print** a variable name (ex: `print z`, it will give you the value of `z` *before* the displayed line of code gets run)
- `help` (`h`) to get **help** on a particular command or usage (ex: `help b` will give you info on the `break` command)
- `quit` (`q`) to **quit**

![[Pasted image 20250326141716.png]]
> **Function breakpoint**, **conditional breakpoint**, **list and delete breakpoints**


- **Function breakpoints**. To set a breakpoint at the beginning of a function, we can use the `b function_name` command. We can use tab completion during input.
- **Conditional breakpoints**. `(gdb) b f.cpp:26 if s==0  // set a breakpoint in f.cpp, line 26, if s==0`; `(gdb) b f.cpp:20 if ((int)strcmp(y, "liberal")) == 0` (translates to `if y == "liberal"`)
- **List and delete breakpoints**. We can list breakpoints: `(gdb) i b`, and we can delete breakpoints: `(gdb) delete breakpoints 1`; `(gdb) delete breakpoints 2-5`
- **Remove or make a breakpoint unconditional**. Since each breakpoint has a number, we can remove a condition from a breakpoint: `(gdb) cond 1  // breakpoint 1 is unconditional now`
- **Watchpoint**. A **watchpoint** ==can stop execution when the value of an expression changes, without having to predict where (in which line) it may happen==. There are three kinds of watchpoints:
	- `watch`: gdb will break when a *write* occurs
	- `rwatch`: gdb will break when a *read* occurs
	- `awatch`: gdb will break when either a *read* or *write* happens
- **Continue**. When we've finished examining the values of variables at a breakpoint, we can use the `continue` or `c` command to continue program execution until the debugger encounters a breakpoint, a **signal**, an error, or normal process termination
- **Finish**. Once we go inside a function, we may want to execute it continuously until it returs to its caller line. This can be done using the `finish` command.
- You should also write `(gdb) set logging on` before working on this, to get a **stack trace** (log) in `gdb.txt` afterwards and read it more comfortably in nvim (rather than on the terminal)
```sh
Projects/expertcplusplus/chap13$ gdb och13_gdb_2.out 
GNU gdb (GDB) 16.2
Copyright (C) 2024 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from och13_gdb_2.out...
(gdb) b dotproduct(float const*, float const*, int) 
Breakpoint 1 at 0x1294: file ch13_gdb_2o.cpp, line 20.
(gdb) b ch13_gdb_2o.cpp:24 if i==1
Breakpoint 2 at 0x12b6: file ch13_gdb_2o.cpp, line 24.
(gdb) i b
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000000000001294 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:20
2       breakpoint     keep y   0x00000000000012b6 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:24
	stop only if i==1
(gdb) cond 2
Breakpoint 2 now unconditional.
(gdb) i b
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000000000001294 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:20
2       breakpoint     keep y   0x00000000000012b6 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:24
(gdb) r
Starting program: /home/CutieSai/chastity_vault/chastity_vault/Coding/Projects/expertcplusplus/chap13/och13_gdb_2.out 
This GDB supports auto-downloading debuginfo from the following URLs:
  <https://debuginfod.archlinux.org>
Enable debuginfod for this session? (y or [n]) y
Debuginfod has been enabled.
To make this setting permanent, add 'set debuginfod enabled on' to .gdbinit.
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib/libthread_db.so.1".
Breakpoint 1, dotproduct (x=0x7fffffffe550, y=0x7fffffffe550, n=5) at ch13_gdb_2o.cpp:20
20	const float *p = x;
(gdb) p x
$1 = (const float *) 0x7fffffffe550
(gdb) c
Continuing.
Breakpoint 2, dotproduct (x=0x7fffffffe550, y=0x7fffffffe550, n=5) at ch13_gdb_2o.cpp:24
24		s += (*p) * (*q);
(gdb) p i
$2 = 0
(gdb) n
23	for(int i=0; i<n; ++i, ++p, ++q){
(gdb) n
Breakpoint 2, dotproduct (x=0x7fffffffe550, y=0x7fffffffe550, n=5) at ch13_gdb_2o.cpp:24
24		s += (*p) * (*q);
(gdb) p s
$3 = 1
(gdb) watch s
Hardware watchpoint 3: s
(gdb) n
Hardware watchpoint 3: s
Old value = 1
New value = 5
dotproduct (x=0x7fffffffe550, y=0x7fffffffe550, n=5) at ch13_gdb_2o.cpp:23
23	for(int i=0; i<n; ++i, ++p, ++q){
(gdb) i b
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000555555555294 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:20
	breakpoint already hit 1 time
2       breakpoint     keep y   0x00005555555552b6 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:24
	breakpoint already hit 2 times
3       hw watchpoint  keep y                      s
	breakpoint already hit 1 time
(gdb) f
#0  dotproduct (x=0x7fffffffe550, y=0x7fffffffe550, n=5) at ch13_gdb_2o.cpp:23
23	for(int i=0; i<n; ++i, ++p, ++q){
(gdb) finish
Run till exit from #0  dotproduct (x=0x7fffffffe550, y=0x7fffffffe550, n=5) at ch13_gdb_2o.cpp:23
Breakpoint 2, dotproduct (x=0x7fffffffe550, y=0x7fffffffe550, n=5) at ch13_gdb_2o.cpp:24
24		s += (*p) * (*q);
(gdb) i b
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000555555555294 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:20
	breakpoint already hit 1 time
2       breakpoint     keep y   0x00005555555552b6 in dotproduct(float const*, float const*, int) 
                                                   at ch13_gdb_2o.cpp:24
	breakpoint already hit 3 times
3       hw watchpoint  keep y                      s
	breakpoint already hit 1 time
(gdb) delete breakpoints 1-3
(gdb) c
Continuing.
dot(x,x) = 55.000000
dot(x,y) = 55.000000
[Inferior 1 (process 4346) exited normally]
(gdb) q
```
> All the commands run to "debug" a file using **GDB (GNU Debugger)**

![[Pasted image 20250326231826.png]]
> Practical debugging strategies

- **Static analysis** is analysing a program without executing it.
- **Dynamic analysis (Dynamic program analysis)** is analysing a program by executing it.
- The automatic static code analysis tools are designed to analyse a set of code against one or multiple sets of **coding rules or guidelines**. People use static code analysis, static analysis, or source code analysis interchangeably.
![[Pasted image 20250326232624.png]]
> Static analysis benefits and limitations

![[Pasted image 20250326232651.png]]
> Automatic C/C++ code analysis tools, `-Wall`, `-Wextra`, `-Weffc++`

Automatic C/C++ code analysis tools:
- **Clang**
- **GNU g++**
- **Clion**
- **CPPCheck**
- **Eclipse**
- Visual Studio

- `-Wall`: Enables all **construction warnings**, which are questionable for some users. These warnings are easy to avoid or modify, even in conjunction with macros. It also enables some language-specific warnings described in "**C++ Dialect Options**" and "**Objective-C/C++ Dialect Options**"

- `-Wextra`: As its name implies, it examines certain extra warning flags that are not checked by `-Wall`. Warning messages for any of the following cases will be printed:
```ad-info
title: -Wextra Guidelines

- A pointer is compared against integer zero with the <, <=, >, or >= operands.
- A non-enumerator and an enumerator show up in a conditional expression.
- Ambiguous virtual bases.
- Subscripting a `register` type array.
- Using the address of a `register` type variable.
- A derived class' copy constructor does not initialize its base class.
- Note that (b)-(f) are C++ only.
```

`-Weffc++`: It checks the violations of some guidelines suggested in "**Effective and More Effective C++"**, written by Scott Meyers. These guidelines include the following:
```ad-info
title: -Weffc++ Guidelines

- Define a copy constructor and an assignment operator for classes with dynamically allocated memory.
- Prefer initialization over assignment in constructors.
- Make destructors virtual in base classes.
- Have the `operator=` return a reference to `*this`.
- Don't try to return a reference when you must return an object.
- Distinguish between prefix and postfix forms of increment and decrement operators.
- Never overload `&&`, `||`, or `,`.
```
- [ ] #TODO Read "**C++ Dialect Options**" and "**Objective-C/C++ Dialect Options**"
- [ ] #TODO Read "**Effective and More Effective C++"**, written by Scott Meyers

- **Dynamic analysis** analyzes the performance of a software program by executing it either on a real or **virtual processor**. It can be done automatically or manually.
- [ ] #TODO **Unit tests, integration tests, system tests**, and **acceptance tests** are typically **human**-involved dynamic analysis processes.
- [ ] #TODO On the other hand, **memory debugging, memory leak detection** and **profiling tools** such as **IBM purify, Valgrind** and **Clang sanitizers** are **automatic** dynamic analysis tools.

- The mechanism of dynamic analysis tools is that they use **code instrumentation** and/or a **simulation environment** to perform checks on the analyzed code *as* it executes. We can interact with a program in the following ways:
	- **Source code instrumentation**: A special code segment is inserted into the original source code *before* compilation
	- **Object code instrumentation**: A special **binary code** is added directly to the executable file
	- **Compilation stage instrumentation**: A **checking code** is added through special compiler switches
	- No source code changes. Instead, it uses special **execution stage libraries** to detect errors.
- Dynamic analysis **pros**: 
	- gives no false positives or false negative results
	- does not need source code, so proprietary code can be tested by a third-party org
- Dynamic analysis **cons**:
	- Only detects defects on the routes related to the input data
	- Can only check one execution path at a time. To obtain a complete picture, we need to run the test as many times as possible
	- Cannot check the correctness of the code (like static analysis)
	- Executing incorrect code on a real processor may have unanticipated results.

- Installing and utilizing **Valgrind** for dynamic analysis:
1. `sudo pacman -S valgrind`
2. `g++ -o ch13_dyn -std=c++11 -Wall ch13_dynamic_analysis.cpp`
3. `valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ./ch13_dyn`
4. Check `valgrind-out.txt` for the `HEAP SUMMARY` and the `LEAK SUMMARY`. Version 2 should have no leak summary (as all the memory has been freed), but version 1 *will* have 40 bytes of leaked data due to not calling `free(p);` inside the `ch13_dynamic_analysis.cpp` file.
5. There are also 150 errors from 10 contexts that...I don't understand xd

![[Pasted image 20250327115241.png]]
> **Unit testing, test-driven development (TDD), behavior-driven development (BDD)**

- A **unit** is an individual component in a larger or more complex application. Unit testing is a software testing method that's used to determine whether a unit of code behaves as expected in terms of its design requirements. The main features of unit testings are:
	- Small and simple, quick to write and run
	- Isolated from dependencies, each one can be ran in parallel
	- Helps understand the unit interface
	- Greatly helps integration and acceptance tests
	- Normally prepared and performed by developers.
- [ ] #TODO While we can write a unit test package from scratch, there are a ton of **Unit Test Frameworks (UTFs)** already being developed by the community: **Boost.Test, CPPUnit, GoogleTest, Unit++,** and **CxxTest** are the most popular ones.
![[Pasted image 20250327122658.png]]
> **Unit testing, Unit Test Frameworks (UTFs)**

- **Test-Driven Development (TDD)** starts by writing failing test code and then adds/modifies the code to let the test pass. After that, we refactorize the test plan and code until all the requirements are satisfied.
- We used `<boost/test/included/unit_test.hpp>` in `ch13_unit_test1.cpp` to get `a.out`
- 