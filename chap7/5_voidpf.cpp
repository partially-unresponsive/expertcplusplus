

#include <cstdio>
typedef void (*PF)(int);
void foo(int arg){
	arg = arg * arg;
}

int bar(int arg, PF f){
	f(arg);
	return arg;
}

int main(){
	int crack = bar(42, foo);
	printf("%d\n", crack);
}

