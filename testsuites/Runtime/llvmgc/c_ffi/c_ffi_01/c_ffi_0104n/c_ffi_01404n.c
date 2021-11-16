#include <unistd.h>

#include "cangjie-basert-api.h"

extern void default_global_init();
extern void aPlusB();
extern void printResult();

int main()
{
    struct ConfigParam param = {
        .coroutineParam = {
            .thStackSize = 0,
            .coStackSize = 64 * 1024,
            .processorNum = 8,
            .coroutineMax = 10000,
            .threadMax = 16
        },
        .heapParam = {
            .heapInitialSize = 64 * 1024 * 1024,
            .heapSize = 256 * 1024 * 1024,
            .heapMaxFree = 10 * 1024 * 1024,
            .heapUtilization = 0.6f,
            .enableLog = false
        }
    };

    CangjieInitFromC(param);

    struct CoroutineAttr attr = { .name = "cangjie", .stack_size = 1 * 1024 * 1024 };

    NewTaskFromC(attr, default_global_init, NULL);
    sleep(1);
    NewTaskFromC(attr, aPlusB, NULL);
    sleep(1);
    NewTaskFromC(attr, printResult, NULL);
    sleep(1);

    return 0;
}
