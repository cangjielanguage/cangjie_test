// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 100\n
// ASSERT: scan-not Exception

from std import sync.*

func main(): Int64 {
    let result = AtomicInt64(0)
    var i: Int64 = 100
    while (i > 0) {
        i = i - 1
        let fut: Future<Unit> = spawn {
            result.fetchAdd(1)
            while(true) {}
        }
    }

    while (result.load() != 100) {
        sleep(0)
    }
    print("result = ${result.load()}\n")
    return 0
}
