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

char* getDate(char* y, char* symA, char* m, char* symB, char* d)
{
    int num = strlen(y)+ strlen(symA) + strlen(m) + strlen(symB) + strlen(d) + 1;
    char* date = (char*)calloc(num, sizeof(char));

    strcat_s(date, num, y);
    strcat_s(date, num, symA);
    strcat_s(date, num, m);
    strcat_s(date, num, symB);
    strcat_s(date, num, d);
    
    return date;
}