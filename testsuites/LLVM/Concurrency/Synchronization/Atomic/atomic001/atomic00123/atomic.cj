// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\n

from std import sync.*

func main(): Int64 {
    let test = AtomicInt32(-1)
    let a: Int32 = test.swap(1)

    let thread: Future<Unit> = spawn {
        if (a == -1) {
            test.swap(-2147483648)
        }
    }

    while (test.load() != -2147483648) {
        sleep(0)
    }

    if (test.load() == -2147483648) {
        print("in main\n")
    }
    return 0
}
