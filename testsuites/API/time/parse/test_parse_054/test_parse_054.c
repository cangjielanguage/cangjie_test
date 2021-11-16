#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

char* getSymbolA()
{
    char* c[] = {",", "/", "-", "#", "@", "%", "^", "&", "*", "_", "=", "+"};
    int len = sizeof(c)/sizeof(c[0]);
    
    srand((unsigned)time(NULL));
    int n = rand() % 12;

    return c[n];
}

char* getSymbolB()
{
    char* c[] = {"/", "-", "#", "@", "%", "^", "&", "*", "_", "=", "+", ","};
    int len = sizeof(c)/sizeof(c[0]);
    
    srand((unsigned)time(NULL));
    int n = rand() % 12;

    return c[n];
}

char* getDate(char* y, char* symA, char* M, char* symB, char* d, char* symC, char* h, char* symD, char* m, char* symE, char* s)
{
    int num = strlen(y)+ strlen(symA) + strlen(M) + strlen(symB) + strlen(d) + strlen(symC) + strlen(h) + strlen(symD) + strlen(m) + strlen(symE) + strlen(s) + 1;
    char* date = (char*)calloc(num, sizeof(char));

    strcat_s(date, num, y);
    strcat_s(date, num, symA);
    strcat_s(date, num, M);
    strcat_s(date, num, symB);
    strcat_s(date, num, d);
    strcat_s(date, num, symC);
    strcat_s(date, num, h);
    strcat_s(date, num, symD);
    strcat_s(date, num, m);
    strcat_s(date, num, symE);
    strcat_s(date, num, s);
    
    return date;
}
