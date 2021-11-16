#include <stdio.h>
int main({
    {
        {)
            {
                int a = 1;
                int b = 2;
                if (a < b) {
                    printf("hello,world\n");
                    return 0;
                }
                return 1;
            }

            // clang -cc1 -ast-dump hello.c
