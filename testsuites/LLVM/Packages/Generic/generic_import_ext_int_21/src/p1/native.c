#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// just for test case: native.cj.
int native_entry(int c) { return c * 100; }

// just for test case: nativeFunction.cj.
typedef struct {
    long x;
    long y;
    long z;
} BiggerStruct;
typedef int (*Compare)(int, int);
typedef int (*Ptf)(const char*, ...);
typedef char* (*StrGetPtr)(char*);
typedef BiggerStruct (*Record2Record)(BiggerStruct);
int Max(int x, int y) { return x > y ? x : y; }
int Min(int x, int y) { return x < y ? x : y; }
char* StrGet(char* chr) { return chr; }
BiggerStruct RecordFunc(BiggerStruct x)
{
    x.x = x.x + 1;
    return x;
}
Compare GetMaxFuncPtr() { return &Max; }
Compare GetMinFuncPtr() { return &Min; }
Ptf GetPrintf() { return &printf; }
StrGetPtr GetStrPtr() { return &StrGet; }
Record2Record GetRecordFuncPtr() { return &RecordFunc; }
long GetAverage(int arr[], int size)
{
    int i;
    long avg;
    long sum = 0;
    for (i = 0; i < size; ++i) {
        sum += arr[i];
    }
    avg = sum / size;
    return avg;
}

void PrintHello() { printf("hello world!"); }
void PrintInt(int a) { printf("%d\n", a); }
