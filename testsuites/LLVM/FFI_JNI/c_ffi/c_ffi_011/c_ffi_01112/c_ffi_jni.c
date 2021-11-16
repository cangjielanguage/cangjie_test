#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern bool testfunc(bool (*a)(bool, bool)) {
    bool res = a(false, true);
    if (res == false){
	return true;
    }else{
        printf("fail\n");
	return false;
    }
}
