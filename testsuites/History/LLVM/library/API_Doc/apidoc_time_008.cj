// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan timer is stoped before fire
// ASSERT: scan Hello
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var timer = Timer(Duration.second(), { print("Hi\n") })

    /* 100ms */
    sleep(100 * 1000 * 1000)
    if (timer.stop()) {
        print("timer is stoped before fire\n")
    } else {
        print("timer is not stoped before fire, maybe something wrong\n")
    }

    timer.reset(Duration.millisecond(200), { print("Hello\n") })
    /* 500ms */
    sleep(500 * 1000 * 1000)

    return 0
}
