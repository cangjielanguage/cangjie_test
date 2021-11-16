// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main\n

from std import sync.*

func main(): Int64 {
    var test = AtomicBool(true)

    let thread: Future<Unit> = spawn {
        var test = AtomicBool(false)
        print("in thread\n")
    }

    thread.getResult()

    test = AtomicBool(true)

    if (test.load()) {
        print("in main\n")
    }

    return 0
}
