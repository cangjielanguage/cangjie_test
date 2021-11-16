#include <stdint.h>
#include <stdio.h>
#include <string.h>

int testfunc(char* input) {
    printf("%s",input);
    char *eos = input;
    while( *eos++ ) ;
    return ( eos - input - 1 );
}
