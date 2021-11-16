#include <stdlib.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

typedef struct {
    int8_t i8;
    uint8_t ui8;
    char* ptr;
}teststruct; 

teststruct testfunc1(){
    teststruct cjstruct;
    cjstruct.i8 = 123;
    cjstruct.ui8 = 123;
    cjstruct.ptr = (char*)malloc(sizeof(char) * 4);
    memset(cjstruct.ptr, 0, 4);
    cjstruct.ptr[0] = 'a';
    cjstruct.ptr[1] = 'b';
    cjstruct.ptr[2] = 'c';
    return cjstruct;
}

int8_t testfunc2(teststruct st){
    printf("2.C get struct from CangJie:\n");
    printf("int8_t: %d\n", st.i8);
    printf("uint8_t: %d\n", st.ui8);
    printf("char*: %s\n", st.ptr);

    if ( (st.i8 == -128) && (st.ui8 == 255) && (st.ptr[0] == 'e') && (st.ptr[1] == 'f') && (st.ptr[2] == 'g')) {
        printf("pass2\n");
    } else {
        printf("fail2\n");
    }

    return 0;
}
