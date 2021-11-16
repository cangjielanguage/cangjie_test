#include <unistd.h>

#include "cangjie-basert-api.h"

extern void pkg_global_init();
extern void aPlusB();
extern void printResult();

int main()
{
    struct ConfigParam param = {
        .coroutineParam = {
            .thStackSize = 64 * 1024,
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

    int result1 = NewTaskFromC(attr, pkg_global_init, NULL);
    sleep(1);
    int result2 = NewTaskFromC(attr, aPlusB, NULL);
    sleep(1);
    int result3 = NewTaskFromC(attr, printResult, NULL);
    sleep(1);

    if ((result1 == 0) && (result2 == 0) && (result3 == 0)) {
        printf("pass2\n");
    }

    return 0;
}
