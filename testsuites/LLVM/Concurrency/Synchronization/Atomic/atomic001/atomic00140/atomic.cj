// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main\n

from std import sync.*

func main(): Int64 {
    var test = AtomicInt64(0)

    let thread: Future<Unit> = spawn {
        var test = AtomicInt64(-9223372036854775808)
        if (test.load() == -9223372036854775808) {
            print("in thread\n")
        }
    }

    thread.getResult()
    test = AtomicInt64(9223372036854775807)

    if (test.load() == 9223372036854775807) {
        print("in main\n")
    }

    return 0
}
