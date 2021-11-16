// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\n

from std import sync.*

func main(): Int64 {
    let test = AtomicBool(false)
    let a = test.swap(true)

    let thread: Future<Unit> = spawn {
        if (!a) {
            test.swap(false)
        }
    }

    while (test.load()) {
        sleep(0)
    }

    if (!test.load()) {
        print("in main\n")
    }
    return 0
}
