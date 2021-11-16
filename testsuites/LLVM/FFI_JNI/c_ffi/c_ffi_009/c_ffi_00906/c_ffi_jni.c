#include <stdlib.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

typedef struct {
    int8_t i8;
    uint8_t ui8;
    char* str;
}teststruct; 

teststruct testfunc1(){
    teststruct cjstruct;
    cjstruct.i8 = 123;
    cjstruct.ui8 = 123;
    cjstruct.str = (char *)malloc(sizeof(char) * 4);
    memset(cjstruct.str, 0, 4);
    cjstruct.str[0] = 'a';
    cjstruct.str[1] = 'b';
    cjstruct.str[2] = 'c';
    return cjstruct;
}

int8_t testfunc2(teststruct st){
    printf("2.C get struct from CangJie:\n");
    printf("int8_t: %d\n", st.i8);
    printf("uint8_t: %d\n", st.ui8);
    printf("char*: %s\n", st.str);
    printf("char*: ptr[0] %d\n", (uint8_t)st.str[0]);
    printf("char*: ptr[1] %d\n", (uint8_t)st.str[1]);
    printf("char*: ptr[2] %d\n", (uint8_t)st.str[2]);

    if ( (st.i8 == -128) && (st.ui8 == 255) && (strcmp("efg", st.str) == 0)) {
        printf("pass2\n");
    } else {
        printf("fail2\n");
    }

    return 0;
}
