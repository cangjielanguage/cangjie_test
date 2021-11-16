#include <cstdint>
#include <cstdio>
#include <string.h>

extern "C" {

int testfunc(char* input) {
    printf(input);
    char *eos = input;
    while( *eos++ ) ;
    return ( eos - input - 1 );
}
void fflushOut(){
    fflush(stdout);
}
}