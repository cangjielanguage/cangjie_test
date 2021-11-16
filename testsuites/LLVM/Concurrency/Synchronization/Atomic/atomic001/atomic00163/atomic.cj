// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\n

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt32(0)
    let a: UInt32 = test.swap(1)

    let thread: Future<Unit> = spawn {
        if (a == 0) {
            test.swap(4294967295)
        }
    }

    while (test.load() != 4294967295) {
        sleep(0)
    }

    if (test.load() == 4294967295) {
        print("in main\n")
    }
    return 0
}
