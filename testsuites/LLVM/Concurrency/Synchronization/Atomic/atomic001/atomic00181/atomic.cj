// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\n

from std import sync.*

func main(): Int64 {
    let test = AtomicBool(true)

    let thread: Future<Unit> = spawn {
        while (test.load()) {
            sleep(0)
            print("in thread\n")
        }
    }

    if (test.load()) {
        print("in main\n")
    }

    return 0
}
