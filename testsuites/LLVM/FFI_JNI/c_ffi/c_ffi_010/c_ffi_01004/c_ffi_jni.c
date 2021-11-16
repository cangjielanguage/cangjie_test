#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct teststruct{
    bool b;
    uint32_t ui32a;
    int8_t i8;
    uint8_t ui8;
};

int32_t structfunc(struct teststruct st){
    printf("bool: %d\n", st.b);
    printf("uint32_t: %c\n", st.ui32a);
    printf("int8_t: %d\n", st.i8);
    printf("uint8_t: %d\n", st.ui8);
    return 0;
}


int main()
{
    //structfunc(cstruct);
    return 0;
}
