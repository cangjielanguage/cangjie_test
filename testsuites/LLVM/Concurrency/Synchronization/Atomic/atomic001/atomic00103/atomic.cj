// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\n

from std import sync.*

func main(): Int64 {
    let test = AtomicInt8(-1)
    let a: Int8 = test.swap(1)

    let thread: Future<Unit> = spawn {
        if (a == -1) {
            test.swap(-128)
        }
    }

    while (test.load() != -128) {
        sleep(0)
    }

    if (test.load() == -128) {
        print("in main\n")
    }
    return 0
}
