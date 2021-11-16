#include <unistd.h>
#include "cangjie-basert-api.h"

extern void a_global_init();
extern void cjFunc();

int main()
{
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

        NewTaskFromC(attr, a_global_init, NULL);
        sleep(1);
        NewTaskFromC(attr, cjFunc, NULL);
        sleep(1);
    }

    return 0;
}
