// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\n

from std import sync.*

func main(): Int64 {
    let test = AtomicInt8(1)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(-128)
    }

    while (test.load() != -128) {
        sleep(0)
    }

    test.store(127)

    if (test.load() == 127) {
        print("in main\n")
    }
    return 0
}
