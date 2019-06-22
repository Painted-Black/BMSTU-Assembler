#include "pch.h"
#include <iostream>

extern "C" void factorial_stack(int n, int* nf);
extern "C" void factorial_registers(int n, int* nf);
extern "C" void factorial_loop(int n, int* nf);

int n = 4, nf = 1;

int main()
{
	factorial_stack(n, &nf);
	std::cout << n << "! = " << nf << std::endl;

	factorial_registers(n, &nf);
	std::cout << n << "! = " << nf << std::endl;

	system("pause");

	return 0;
}

