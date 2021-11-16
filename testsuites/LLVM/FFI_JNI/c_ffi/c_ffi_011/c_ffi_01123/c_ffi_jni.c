#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* get_cstr(char*(*ptr)(char*, char*) ){
    char* resb = ptr("Hello", "World");
    return resb;
}
