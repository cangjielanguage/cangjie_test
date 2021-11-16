#include <stdint.h>
#include <stdio.h>
#include <string.h>

int testfunc(char* a, char* b, char* c, char* d, char* e) {
    char* temp = a;
    while (*temp != '\0') temp++;
    while ((*temp++ = *b++) != '\0');
    char* temp1 = a;
    while (*temp1 != '\0') temp1++;
    while ((*temp1++ = *c++) != '\0');
    char* temp2 = a;
    while (*temp2 != '\0') temp2++;
    while ((*temp2++ = *d++) != '\0');
    char* temp3 = a;
    while (*temp3 != '\0') temp3++;
    while ((*temp3++ = *e++) != '\0');
    printf(a);
    char *eos = a;
    while( *eos++ ) ;
    return ( eos - a - 1 );
}
void fflushOut(){
    fflush(stdout);
}
