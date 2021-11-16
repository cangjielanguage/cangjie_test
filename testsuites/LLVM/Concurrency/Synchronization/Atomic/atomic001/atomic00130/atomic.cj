// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main\n

from std import sync.*

func main(): Int64 {
    var test = AtomicInt32(0)

    let thread: Future<Unit> = spawn {
        var test = AtomicInt32(-2147483648)
        if (test.load() == -2147483648) {
            print("in thread\n")
        }
    }

    thread.getResult()
    test = AtomicInt32(2147483647)

    if (test.load() == 2147483647) {
        print("in main\n")
    }

    return 0
}
