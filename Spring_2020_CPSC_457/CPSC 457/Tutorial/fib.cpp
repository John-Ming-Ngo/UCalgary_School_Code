#include <iostream>

int main(int argc, char* argv[]) {
	if (argc != 2) {
		std::cerr << "Too many or too few arguments!";
		exit(1);
	}
	int n =  atoi(argv[1]);
	
	if (n < 0) {
		std::cerr << "Negative fibbonacci is nonsense!";
		exit(1);
	}
	
	int fib0 = 0;
	
	std::cout << fib0 << " ";
	
	int fib1 = 1;
	
	int nextFib;
	for (int i = 0; i < n; i++) {
		nextFib = fib0 + fib1;
		std::cout << fib1 << " ";
		fib0 = fib1;
		fib1 = nextFib;
	}
}