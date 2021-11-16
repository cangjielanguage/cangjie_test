#include <unistd.h>
#include "cangjie-basert-api.h"

extern void default_global_init();
extern void cjFunc();

int main()
{
    struct CoroutineAttr attr = { .name = "cangjie", .stack_size = 2 * 1024 * 1024 };

    int a = NewTaskFromC(attr, cjFunc, NULL);
    sleep(1);

    return 0;
}
