#include <unistd.h>
#include "cangjie-basert-api.h"

extern void default_global_init();
extern struct Data *cjFunc(struct Data *cp);

struct Data {
    bool b;
    uint8_t ui8;
    int8_t i8;
    uint16_t ui16;
    int16_t i16;
    uint32_t ui32;
    int32_t i32;
    uint64_t ui64;
    int64_t i64;
    float f32;
    double f64;
    int8_t* i8p;
    char* str;
};

int main()
{
    struct Data data1;
    data1.b = true;
    data1.ui8 = 0;
    data1.i8 = -1;
    data1.ui16 = 0;
    data1.i16 = -1;
    data1.ui32 = 0;
    data1.i32 = -1;
    data1.ui64 = 0;
    data1.i64 = -1;
    data1.i8p = 0;
    data1.str = "abc";

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
        int b = NewTaskFromC(attr, cjFunc, &data1);
        sleep(1);

	if ((a ==0) && (b==0)) {
            printf("%s", data1.str);
            printf("%d", strcmp(data1.str, "efg"));
	    if ((data1.b == false) && (data1.ui8 == 3) && (data1.i8 == 1) && (data1.ui16 == 3) && (data1.i16 == 1) && (data1.ui32 == 3) && (data1.i32 == 1) && (data1.ui64 == 3) && (data1.i64 == 1) && (data1.i8p == 0) && (strcmp(data1.str, "efg") == 0)) {
	        printf("pass2\n");
	    }
	}
    }

    return 0;
}
