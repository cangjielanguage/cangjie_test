// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main\n

from std import sync.*

func main(): Int64 {
    var test = AtomicInt16(0)

    let thread: Future<Unit> = spawn {
        var test = AtomicInt16(-32768)
        if (test.load() == -32768) {
            print("in thread\n")
        }
    }

    thread.getResult()
    test = AtomicInt16(32767)

    if (test.load() == 32767) {
        print("in main\n")
    }

    return 0
}
