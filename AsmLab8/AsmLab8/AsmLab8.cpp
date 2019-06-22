#include "pch.h"
#include <iostream>

void printMatrix();
void transposAsm(int matrix[8][8]);
void transpos(int matrix[8][8]);

int mCols = 5, mRows = 5;
int m[8][8] = { {1, 1, 1, 1, 1},
				{2, 2, 2, 2, 2},
				{3, 3, 3, 3, 3},
				{4, 4, 4, 4, 4},
				{5, 5, 5, 5, 5} };

int main()
{
	std::cout << "Initial matrix:" << std::endl;
	printMatrix();

	transpos(m);

	std::cout << "Transposed matrix" << std::endl;
	printMatrix();
}

void transpos(int matrix[8][8])
{
	int d = 0;
	for (int i = 0; i < mCols; ++i)
		for (int j = 0; j < i; ++j)
		{
			int tmp = m[i][j];
			m[i][j] = m[j][i];
			m[j][i] = tmp;
		}
}

void transposAsm(int matrix[8][8])
{
	_asm {
		mov eax, offset m; m

		mov ecx, 4
		main:
		mov esi, 4; установка начала цикла в диагональный элемент
			mov edi, 32
			push ecx
			exchange :
		xchg edx, [eax][esi]
			xchg edx, [eax][edi]
			xchg edx, [eax][esi]
			add esi, 4
			add edi, 32
			loop exchange
			pop ecx
			add eax, 36
			loop main
	}
}

void printMatrix()
{
	for (int i = 0; i < mCols; ++i)
	{
		for (int j = 0; j < mRows; ++j)
			std::cout << m[i][j];
		std::cout << std::endl;
	}
}

