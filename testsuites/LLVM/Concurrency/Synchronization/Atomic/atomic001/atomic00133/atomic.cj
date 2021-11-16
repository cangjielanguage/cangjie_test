// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\n

from std import sync.*

func main(): Int64 {
    let test = AtomicInt64(-1)
    let a: Int64 = test.swap(1)

    let thread: Future<Unit> = spawn {
        if (a == -1) {
            test.swap(-9223372036854775808)
        }
    }

    while (test.load() != -9223372036854775808) {
        sleep(0)
    }

    if (test.load() == -9223372036854775808) {
        print("in main\n")
    }
    return 0
}
