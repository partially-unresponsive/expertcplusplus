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


- **Function breakpoints**. To set a breakpoint at the beginning of a function, we can use the `b function_name` command.
