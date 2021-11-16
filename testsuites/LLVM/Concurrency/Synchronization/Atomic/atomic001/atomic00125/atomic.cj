// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -2147483648

from std import sync.*

func main(): Int64 {
    let test = AtomicInt32(2147483547)
    test.fetchAdd(1)
    var i: Int64 = 0

    while (i < 100) {
        i = i + 1
        let thread: Future<Int32> = spawn {
            test.fetchAdd(1)
        }
    }

    while (test.load() != -2147483648) {
        sleep(0)
    }
    print(test.load().toString())
    return 0
}
