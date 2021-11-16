// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result > 1000\n
// ASSERT: scan-not Exception

from std import sync.*

let result = AtomicInt64(0)

func test(): Unit {
    result.fetchAdd(1)
    if (result.load() <= 1000) {
        test()
    }
}

func main(): Int64 {
    var count: Int64 = 0
    while (count < 1000) {
        count = count + 1
        let fut: Future<Unit> = spawn {
            test()
            print("in thread\n")
        }
    }

    while (result.load() <= 1000) {
        sleep(0)
    }

    print("result > 1000\n")
    return 0
}
