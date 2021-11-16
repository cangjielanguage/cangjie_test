#include <unistd.h>
#include "cangjie-basert-api.h"

extern void default_global_init();
extern uint16_t *cjFunc(uint16_t *ptr1);

int main()
{
    uint16_t* ptr = (uint16_t*)malloc(sizeof(uint16_t) * 3);
    ptr[0] = 0;
    ptr[1] = 65;
    ptr[2] = 65535;

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
        int b = NewTaskFromC(attr, cjFunc, ptr);
        sleep(1);

	if ((a == 0) && (b == 0)) {
            if ((ptr[0] == 1) && (ptr[1] == 2) && (ptr[2] == 3)) {
                printf("pass2\n");
            }
        }
    }

    return 0;
}
