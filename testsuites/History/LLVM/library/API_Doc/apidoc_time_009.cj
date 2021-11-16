// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan due to ticker is stoped, so this is the first print
// ASSERT: scan Hello
// ASSERT: scan Hello
// ASSERT: scan Hello
// ASSERT: scan Hello
// ASSERT: scan Hello
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var ticker = Ticker(Duration.millisecond(200), { print("Hi\n") })

    /* 100ms */
    sleep(100 * 1000 * 1000)
    ticker.stop()
    /* 500ms */
    sleep(500 * 1000 * 1000) 
    print("due to ticker is stoped, so this is the first print\n")

    ticker.reset(Duration.millisecond(100), { print("Hello\n") })
    /* 500ms */
    sleep(500 * 1000 * 1000) 

    return 0
}
