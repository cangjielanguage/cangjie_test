#include <unistd.h>
#include "cangjie-basert-api.h"

extern void default_global_init();
extern int8_t **cjFunc(int8_t **ptr1);

int main()
{
    int8_t* ptr = (int8_t*)malloc(sizeof(int8_t) * 3);
    int8_t** array = (int8_t**)malloc(sizeof(ptr) * 1);
    array[0] = ptr;
    array[0][0] = 1;
    array[0][1] = 1;
    array[0][2] = 1;

    struct ConfigParam param = {
        .coroutineParam = {
            .thStackSize = 64 * 1024,
            .coStackSize = 64 * 1024,
            .processorNum = 8,
            .coroutineMax = 1000,
            .threadMax = 8
        },
        .heapParam = {
            .heapInitialSize = 128 * 1024 * 1024,
            .heapSize = 256 * 1024 * 1024,
            .heapMaxFree = 128 * 1024 * 1024,
            .heapUtilization = 0.8f,
            .enableLog = false
        }
    };

    int result = CangjieInitFromC(param);

    if (result == 0) {
        struct CoroutineAttr attr = { .name = "cangjie", .stack_size = 2 * 1024 * 1024 };

        int a = NewTaskFromC(attr, default_global_init, NULL);
        sleep(1);
        int b = NewTaskFromC(attr, cjFunc, array);
        sleep(1);

	if ((a == 0) && (b == 0)) {
	    if ((array[0][0] = -128) && (array[0][1] == 0) && (array[0][2] == 127)){
                printf("pass2\n");
            }
	}
    }

    return 0;
}
