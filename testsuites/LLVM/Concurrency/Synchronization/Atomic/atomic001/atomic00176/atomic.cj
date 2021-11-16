// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 18446744073709551615

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt64(100)
    test.fetchSub(1)
    var i: Int64 = 0

    while (i < 100) {
        i = i + 1
        let thread: Future<UInt64> = spawn {
            test.fetchSub(1)
        }
    }

    while (test.load() != 18446744073709551615) {
        sleep(0)
    }
    print(test.load().toString())
    return 0
}
