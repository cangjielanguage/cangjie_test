// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan compareAndSwap success\n

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt64(1)

    let thread: Future<Unit> = spawn {
        var a: Bool = false
        a = test.compareAndSwap(1, 0)
    }

    while (test.load() != 0) {
        sleep(0)
    }

    if (test.load() == 0) {
        print("compareAndSwap success\n")
    }
    return 0
}
