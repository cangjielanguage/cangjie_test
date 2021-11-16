// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main\n

from std import sync.*

func main(): Int64 {
    var test = AtomicUInt64(0)

    let thread: Future<Unit> = spawn {
        var test = AtomicUInt64(18446744073709551615)
        if (test.load() == 18446744073709551615) {
            print("in thread\n")
        }
    }

    thread.getResult()
    test = AtomicUInt64(9223372036854775808)

    if (test.load() == 9223372036854775808) {
        print("in main\n")
    }

    return 0
}
